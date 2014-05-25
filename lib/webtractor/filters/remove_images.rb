module Webtractor::Filters
  class RemoveImages
    def process page
      page.css('img').remove
      page
    end
  end
end
