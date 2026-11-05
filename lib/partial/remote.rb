# frozen_string_literal: true

require 'open-uri'

module Partial
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

    MAX_ATTEMPTS = 5

    def content
      text = fetch
      # Rewrite relative image paths to absolute GitHub URLs so they render outside their source repo
      text.scan(/\!\[.*\]\((.*)\)/).flatten
          .reject { |ip| ip.start_with?('http') }
          .each   { |ip| text.gsub!(ip, "#{@base_url}/#{ip}") }
      text.scan(/src="(images\/.*)"/).flatten
          .each   { |ip| text.gsub!(ip, "#{@base_url}/#{ip}") }
      text
    end

    private

    # raw.githubusercontent.com intermittently answers concurrent requests with
    # 5xx errors (e.g. "501 First fragment: Transfer-Encoding not supported"),
    # so retry transient failures with exponential backoff
    def fetch
      attempt = 0
      begin
        attempt += 1
        URI.open(@url).read
      rescue OpenURI::HTTPError, SocketError, Timeout::Error, SystemCallError, OpenSSL::SSL::SSLError => e
        status = e.respond_to?(:io) ? e.io.status.first.to_i : nil
        transient = status.nil? || status == 429 || status >= 500
        raise unless transient && attempt < MAX_ATTEMPTS

        warn "retrying #{@url} (attempt #{attempt} of #{MAX_ATTEMPTS} failed): #{e.message}"
        sleep(2**attempt)
        retry
      end
    end
  end
end
