module Webtractor::Filters
  class RemoveTables
    def process page
      page.css('table').remove
      page
    end
  end
end
