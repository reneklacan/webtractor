module Webtractor::Filters
  class RemoveEmpty
    def process page
      explore(page.name, page)
      page
    end

    def explore path, node
      path += "/#{node.name}"

      node.children.each do |child|
        explore(path, child)
      end

      empty = node.text.nil? || node.text.strip == ''
      hidden = node['class'] && node['class'].include?('hidden')
      node.remove if empty || hidden
    end
  end
end
