module Webtractor::Filters
  class RemoveComments
    def process page
      page.xpath('//*[contains(@class, "comment")]').remove
      page.xpath('//*[contains(@id, "comment")]').remove
      page
    end
  end
end
