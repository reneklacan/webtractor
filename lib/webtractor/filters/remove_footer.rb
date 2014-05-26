module Webtractor::Filters
  class RemoveFooter
    def process page
      page.css('footer').remove
      page.xpath('//*[contains(@id, "footer")]').remove
      page.xpath('//*[contains(@class, "footer")]').remove
      page
    end
  end
end
