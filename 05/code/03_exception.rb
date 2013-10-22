#!/usr/bin/env ruby
require 'open-uri'

uri = "http://pragprog.com/podcasts"
web_page = open(uri)
output = File.open("podcasts.html", "w")
while line = web_page.gets
    output.puts line
end
output.close