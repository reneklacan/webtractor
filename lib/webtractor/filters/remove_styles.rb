module Webtractor::Filters
  class RemoveStyles
    def process page
      page.css('style').remove
      page
    end
  end
end
