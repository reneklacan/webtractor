require 'open-uri'
require 'mechanize'
require 'nokogiri'
require 'cachy'
require 'moneta'

require 'webtractor/extractor'
require 'webtractor/result'
require 'webtractor/filters/filter_group'
require 'webtractor/filters/default_filter'
require 'webtractor/filters/remove_scripts'
require 'webtractor/filters/remove_styles'
require 'webtractor/filters/remove_images'
require 'webtractor/filters/remove_forms'
require 'webtractor/filters/remove_tables'
require 'webtractor/filters/remove_comments'
require 'webtractor/filters/remove_noncontent'
require 'webtractor/filters/remove_menus'
require 'webtractor/filters/remove_footer'
require 'webtractor/filters/remove_header'
require 'webtractor/filters/remove_embeds'
require 'webtractor/filters/remove_smallest'
require 'webtractor/filters/remove_empty'
require 'webtractor/filters/remove_attrs'
require 'webtractor/filters/biggest_block'

begin
  Cachy.cache_store
rescue RuntimeError
  Cachy.cache_store = Moneta.new(:File, dir: '/tmp/webtractor.cache')
end
