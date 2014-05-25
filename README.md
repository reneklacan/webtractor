# Webtractor

The Webtractor is a ruby library which is able to extract main content
from webpages like news, blogs, etc. As a result you can just a main
content without any boilerplate (menu, footer, comments, etc).

## Installation

You can install it directly via gem:

```
gem install webtractor
```

Or you can put it in your Gemfile:

```ruby
gem 'webtractor'
```

Then run:

```
bundle install
```

## Basic usage

```ruby
extractor = Webtractor::Extractor.new
result = extractor.extract_from_url
'http://techcrunch.com/2014/05/24/dont-believe-anyone-who-tells-you-learning-to-code-is-easy/'
puts result.text
```

Or

```ruby
extractor = Webtractor::Extractor.new
result = extractor.extract '<html><body>...</body></html>'
```

Or

```ruby
page = Nokogiri::HTML(...)
extractor = Webtractor::Extractor.new
result = extractor.extract_from_xml page
```

You can also access Nokogiri document from result via xml attribute:

```ruby
puts result.xml.xpath('...').text 
```

## Advanced usage

Process of getting main content from the webpage is really simple. It
consists of applying multiple filters on the document where every filter
gets on input output of the last applied filter.

You can look at the names of default filters:

```ruby
p Webtractor::Filters::DefaultFilter.new.filters.map{|f| f.class.to_s}
```

You can remove any filter:

```ruby
extractor.remove_filter Webtractor::Filters::RemoveComments
```

Or you can also create your own filter. It can be any class which
implements *process* method which takes page as an argument and returns
page:

```ruby
class RemoveBolds
  def process page
    page.css('b').remove
    page
  end
end

extractor.add_filter RemoveBolds.new
```

## License

This library is distributed under the Bearware license.
