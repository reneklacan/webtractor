module Webtractor::Filters
  class RemoveEmbeds
    def process page
      page.css('embed').remove
      page.css('object').remove
      page.xpath('//*[contains(@class, "video")]').remove
      page
    end
  end
end
