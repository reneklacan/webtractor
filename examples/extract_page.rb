require 'webtractor'

extractor = Webtractor::Extractor.new
result = extractor.extract_from_url('http://techcrunch.com/2014/05/24/dont-believe-anyone-who-tells-you-learning-to-code-is-easy/')
puts result.text
