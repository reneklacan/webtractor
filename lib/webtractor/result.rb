module Webtractor
  class Result
    attr_accessor :title, :text, :xml

    def initialize title, xml
      @title = title
      @text = xml.text
      @xml = xml
    end
  end
end
