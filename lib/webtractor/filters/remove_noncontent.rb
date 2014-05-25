module Webtractor::Filters
  class RemoveNoncontent
    def process page
      page.css('br').remove
      page.css('hr').remove
      page
    end
  end
end
