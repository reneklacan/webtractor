$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'webtractor/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'webtractor'
  s.version     = Webtractor::VERSION
  s.authors     = ['Rene Klacan']
  s.email       = ['rene@klacan.sk']
  s.homepage    = 'https://github.com/reneklacan/webtractor'
  s.summary     = 'The Webtractor library can extract main content from websites like news, blogs, etc without unwanted boilerplate (menus, footer, comments)'
  s.description = 'The Webtractor library can extract main content from websites like news, blogs, etc without unwanted boilerplate (menus, footer, comments)'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'LICENSE', 'Rakefile', 'README.md']
  s.test_files = Dir['test/**/*']

  s.required_ruby_version = '>= 1.9'
  s.add_dependency 'mechanize'
  s.add_dependency 'nokogiri'
  s.add_dependency 'cachy'
  s.add_dependency 'moneta'
  s.add_development_dependency 'jazz_hands'
end
