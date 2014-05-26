module Webtractor
  class Extractor
    attr_accessor :filters

    def initialize params={}
      @agent = params[:agent] || Mechanize.new
      @filters = params[:filters] || [Filters::DefaultFilter.new]
      @cache = params[:cache] || false
      @cache_params = params[:cache_params] || {}
    end

    def extract text
      extract_from_xml(Nokogiri::HTML(text))
    end

    def extract_from_xml page
      title = page.xpath('//head/title').text
      body = page.at('body')
      @filters.each do |filter|
        body = filter.process(body)
      end
      Result.new(title, body)
    end

    def extract_from_url url
      content = Cachy.cache_if(@cache, "webtractor.#{url}", @cache_params) do
        @agent.get(url).content
      end
      extract(content)
    end

    def add_filter filter
      if filter.is_a?(Class)
        @filters << filter.new
      else
        @filters << filter
      end
    end

    def remove_filter filter
      filter = filter.class unless filter.is_a?(Class)
      @filters = @filters.reject!{|f| f.is_a?(filter)}
    end

    def clear_filters
      @filters.clear
    end
  end
end
