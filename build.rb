#!/usr/bin/env ruby -wU

require 'open-uri'
require 'liquid'

require_relative 'builds'

def load_de_setup_partial(name, locale)
  name = File.join(locale, name) unless locale.empty?
  file = File.join("_partials", "#{name}.md")
  content = URI.open("https://raw.githubusercontent.com/lewagon/data-engineering-setup/main/#{file}").read
  content.scan(/\!\[.*\]\((.*)\)/).flatten
         .reject { |ip| ip.start_with?("http") }
         .each   { |ip| content.gsub!(ip, "https://github.com/lewagon/data-engineering-setup/blob/main/#{ip}") }
  content.scan(/src="(images\/.*)"/).flatten
         .each { |ip| content.gsub!(ip, "https://github.com/lewagon/data-engineering-setup/blob/main/#{ip}") }
  content
end

def load_setup_partial(name, locale)
  name = File.join(locale, name) unless locale.empty?
  file = File.join("_partials", "#{name}.md")
  content = URI.open("https://raw.githubusercontent.com/lewagon/setup/master/#{file}").read
  content.scan(/\!\[.*\]\((.*)\)/).flatten
         .each { |ip| content.gsub!(ip, "https://github.com/lewagon/setup/blob/master/#{ip}") }
  content
end

def load_local_partial(name, locale)
  name = File.join(locale, name) unless locale.empty?
  File.read(File.join("_partials", "#{name}.md"), encoding: "utf-8")
end

def load_partial(partial, locale)
  if (m = partial.match(%r{\Ade_setup/(?<name>[0-9a-z_]+)\z}))
    load_de_setup_partial(m[:name], locale)
  elsif (m = partial.match(%r{\Asetup/(?<name>[0-9a-z_]+)\z}))
    load_setup_partial(m[:name], locale)
  else
    load_local_partial(partial, locale)
  end
end

def partial_name(entry) = entry.is_a?(Array) ? entry[0] : entry
def partial_vars(entry) = entry.is_a?(Array) ? entry[1] : {}
def skipped?(entry) = partial_name(entry).start_with?("#")

def collect_partials
  BUILDS.flat_map { |filename, build|
    LOCALES.flat_map { |locale|
      next [] if !locale.empty? && ENGLISH_ONLY.include?(filename)
      build[:partials].reject { |e| skipped?(e) }.map { |e| [partial_name(e), locale] }
    }
  }.uniq.map { |partial, locale|
    ["#{partial}.#{locale}", load_partial(partial, locale)]
  }.to_h
end

def render_content(content, os_name, variables)
  Liquid::Template.parse(content).render(variables.merge('os' => os_name))
end

def generate_files(loaded)
  LOCALES.each do |locale|
    BUILDS.each do |filename, build|
      next if !locale.empty? && ENGLISH_ONLY.include?(filename)

      output = locale.empty? ? "#{filename}.md" : "#{filename}.#{locale}.md"

      File.open(output, "w:utf-8") do |f|
        build[:partials].reject { |e| skipped?(e) }.each do |entry|
          content = loaded["#{partial_name(entry)}.#{locale}"].clone
          variables = CONSTANTS.merge(partial_vars(entry))
          f << render_content(content, build[:os], variables)
          f << "\n\n"
        end
      end
    end
  end
end

loaded = collect_partials
generate_files(loaded)
