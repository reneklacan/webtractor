module Webtractor::Filters
  class RemoveSmallest
    def process page
      explore(page.name, page)
      page
    end

    def explore path, node
      path += "/#{node.name}"
      words = (node.text || '').split

      node.children.each do |child|
        explore(path, child)
      end

      node.remove if words.count < node.children.count
    end
  end
end
