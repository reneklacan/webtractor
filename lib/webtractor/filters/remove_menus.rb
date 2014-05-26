module Webtractor::Filters
  class RemoveMenus
    def process page
      page.css('nav').remove
      page.css('#pane').remove
      page.css('#carousel').remove
      page.css('#sidebar').remove
      page.css('.pane').remove
      page.css('.carousel').remove
      page.css('.sidebar').remove

      page.css('ul').each do |ul|
        li_count = ul.css('li').count
        a_count = ul.xpath('./a[@href]').count
        ul.remove if a_count >= li_count.to_f/2
      end

      explore(page.name, page)

      page
    end

    def explore path, node
      path += "/#{node.name}"

      node.children.each do |child|
        explore(path, child)
      end

      return if node.name == 'p'

      links_count = node.xpath('./a').size

      if links_count > 0 && links_count.to_f/node.children.count >= 0.3
        node.remove
      end
    end
  end
end
