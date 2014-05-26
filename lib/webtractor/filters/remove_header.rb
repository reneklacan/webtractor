module Webtractor::Filters
  class RemoveHeader
    def process page
      page.css('header').remove
      page.xpath('//*[contains(@class, "header")]').remove
      page.xpath('//*[contains(@id, "header")]').remove
      page
    end
  end
end
