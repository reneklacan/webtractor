module Webtractor::Filters
  class RemoveForms
    def process page
      page.css('form').remove
      page
    end
  end
end
