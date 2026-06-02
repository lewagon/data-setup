# frozen_string_literal: true

require 'open-uri'

module Partial
  REMOTE_REGEX = %r{\A(?<repo>[a-z][a-z0-9_-]*)/(?<name>[a-z0-9_]+)\z}

  # entry is either a plain string or a hash: { 'name' => '...', 'vars' => { ... } }
  def self.from(entry, locale, repos_cfg)
    name = entry.is_a?(Hash) ? entry['name'] : entry
    vars = entry.is_a?(Hash) ? entry.fetch('vars', {}) : {}
    if (m = name.match(REMOTE_REGEX))
      Remote.new(m[:repo], locale, m[:name], vars, repos_cfg)
    else
      Local.new(locale, name, vars)
    end
  end

  class Remote
    attr_reader :url, :vars

    def initialize(repo, locale, name, vars, repos_cfg)
      repo      = repos_cfg.dig('aliases',  repo) || repo
      branch    = repos_cfg.dig('branches', repo) || 'main'
      path      = locale == 'en' ? name : "#{locale}/#{name}"
      @base_url = "https://github.com/lewagon/#{repo}/blob/#{branch}"
      @url      = "https://raw.githubusercontent.com/lewagon/#{repo}/#{branch}/_partials/#{path}.md"
      @vars     = vars
    end

    def content
      warn "fetching #{@url}"
      text = URI.open(@url).read
      # Rewrite relative image paths to absolute GitHub URLs so they render outside their source repo
      text.scan(/\!\[.*\]\((.*)\)/).flatten
          .reject { |ip| ip.start_with?('http') }
          .each   { |ip| text.gsub!(ip, "#{@base_url}/#{ip}") }
      text.scan(/src="(images\/.*)"/).flatten
          .each   { |ip| text.gsub!(ip, "#{@base_url}/#{ip}") }
      text
    end
  end

  class Local
    attr_reader :url, :vars

    def initialize(locale, name, vars)
      localized = "_partials/#{locale}/#{name}.md"
      english   = "_partials/#{name}.md"
      @url      = (locale != 'en' && File.exist?(localized)) ? localized : english
      @vars     = vars
    end

    def content = File.read(@url, encoding: 'utf-8')
  end
end
