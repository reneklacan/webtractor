module Webtractor::Filters
  class RemoveScripts
    def process page
      page.css('script').remove
      page.css('noscript').remove
      page
    end
  end
end
