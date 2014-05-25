module Webtractor::Filters
  class FilterGroup
    def initialize fs=nil
      @filters = fs || filters
    end

    def filters
      []
    end

    def process page
      @filters.each do |filter|
        page = filter.process(page)
      end
      page
    end
  end
end
