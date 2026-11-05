# frozen_string_literal: true

class PartialCache
  POOL_SIZE = 20

  def initialize(localized_builds)
    partials = localized_builds
      .flat_map(&:partials)
      .uniq    { |partial| partial.url }
      .sort_by { |partial| partial.url }

    @cache = fetch_all(partials)
      .tap { |results| results.each { |url, _| warn "fetched #{url}" } }
      .to_h
  end

  def [](url)
    @cache[url]
  end

  private

  # Fetch partials with at most POOL_SIZE concurrent requests
  def fetch_all(partials)
    queue = Queue.new
    partials.each { |partial| queue << partial }
    queue.close

    results = Array.new(partials.size)
    index   = partials.each_with_index.to_h { |partial, i| [partial.url, i] }

    Array.new([POOL_SIZE, partials.size].min) {
      Thread.new {
        while (partial = queue.pop)
          results[index[partial.url]] = [partial.url, partial.content]
        end
      }
    }.each(&:join)

    results
  end
end
