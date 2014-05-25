module Webtractor::Filters
  class RemoveEmpty
    def process page
      explore(page.name, page.at('body'))
      page
    end

    def explore path, node
      path += "/#{node.name}"

      node.children.each do |child|
        explore(path, child)
      end

      node.remove if node.text.nil? || node.text.strip == ''
    end
  end
end
