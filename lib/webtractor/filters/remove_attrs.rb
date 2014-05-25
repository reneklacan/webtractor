module Webtractor::Filters
  class RemoveAttrs
    def process page
      page.css('*').each do |a|
        a.attributes.each do |attr, value|
          a.attributes[attr].remove
        end
      end
      page
    end
  end
end
