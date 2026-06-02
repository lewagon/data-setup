# frozen_string_literal: true

require 'liquid'
require_relative 'partial'

class Builder
  def initialize(builds, constants, repos_cfg)
    @builds    = builds
    @constants = constants
    @repos_cfg = repos_cfg
  end

  def run
    builds = @builds.transform_values { |build|
      build.merge(partials: build[:locales].to_h { |locale|
        [locale, build[:partials].map { |name| Partial.from(name, locale, @repos_cfg) }]
      })
    }
    loaded = collect_partials(builds)
    generate_files(loaded, builds)
  end

  private

  def collect_partials(builds)
    builds.flat_map { |_filename, build|
      build[:partials].flat_map { |_locale, partials| partials }
    }.uniq    { |partial| partial.url }
     .sort_by { |partial| partial.url }
     .map     { |partial| Thread.new { [partial.url, partial.content] } }
     .map     { |t| t.value }
     .to_h
  end

  def generate_files(loaded, builds)
    builds.each do |filename, build|
      build[:locales].each do |locale|
        output = locale == 'en' ? "#{filename}.md" : "#{filename}.#{locale}.md"

        warn "building #{output}"
        File.open(output, 'w:utf-8') do |f|
          build[:partials][locale].each { |partial| f << render(loaded[partial.url].clone, build[:os], partial.vars, output) }
        end
      end
    end
  end

  def render(content, os, vars, output)
    variables = @constants.merge(vars).merge('os' => os, 'build_md' => output)
    "#{Liquid::Template.parse(content).render(variables)}\n\n"
  end
end
