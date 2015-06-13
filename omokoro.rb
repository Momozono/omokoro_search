#-*-coding: utf-8-*-
require 'anemone'
require 'open-uri'

opts = {
	:depth_limit => 0
}

title_array = Array.new

Anemone.crawl("http://omocoro.jp/", opts) do |anemone|
   anemone.on_every_page do |page|
   	    page.doc.xpath("//*[@id='topics']/ul[@class='list-main']//ul/li[@class='content']/span[@class='title']/a").each do |node|
   	    	node.xpath("./text()").each do |title|
   	    		title_array << title.to_s
   	    	end
   	    end
	end
end

puts title_array[rand(6)]
