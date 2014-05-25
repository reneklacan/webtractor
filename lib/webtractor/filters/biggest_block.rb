module Webtractor::Filters
  class BiggestBlock
    def initialize threshold=50.0
      @threshold = threshold
    end

    def process page
      @nodes = {}
      explore(page.name, page.at('body'))
      @nodes = Hash[@nodes.sort.reverse]

      max = @nodes.keys[0]
      last_percents = 100.0
      last_node = @nodes.values[0]

      @nodes.each do |size, node|
        percents = size.to_f/max*100
        diff = last_percents - percents
        return last_node if diff > @threshold
        last_percents = percents
        last_node = node
      end
      page
    end

    def explore path, node
      path += "/#{node.name}"
      size = node.text ? node.text.size : 0

      @nodes[size] = node

      node.children.each do |child|
        explore(path, child)
      end
    end
  end
end
