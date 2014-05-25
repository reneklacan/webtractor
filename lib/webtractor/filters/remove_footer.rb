module Webtractor::Filters
  class RemoveFooter
    def process page
      page.css('footer').remove
      page
    end
  end
end
