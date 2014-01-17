require "cobweb"

class Crawler
  def initialize(args = {})
    @crawler = args.fetch(:crawler_engine) { CobwebCrawler.new }
  end

  def site_map
    @statistics ||= statistics
  end

  private

  attr_reader :crawler

  def statistics
    Hash.new.tap do |statistics|
      crawler.crawl(url) do |page|
        statistics[page.fetch(:url)] = statistics_for_url(page)
      end
    end
  end

  def statistics_for_url(page)
    {
      :links  => links(page),
      :assets => assets(page),
    }
  end

  def links(page)
    page.fetch(:links).fetch(:links)
  end

  def assets(page)
    Hash.new.tap do |assets|
      assets[:images]  = page.fetch(:links).fetch(:images)
      assets[:scripts] = page.fetch(:links).fetch(:scripts)
      assets[:styles]  = page.fetch(:links).fetch(:styles)
    end
  end

  def url
    "https://gocardless.com/"
  end
end
