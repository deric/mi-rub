#!/usr/bin/env ruby
require 'open-uri'

page = 'podcasts'
uri = "http://pragprog.com/#{page}"
web_page = open(uri)
file_name = 'podcasts.html'
output = File.open(file_name, "w")
begin
  while line = web_page.gets
      output.puts line
  end
  output.close
rescue Exception
  STDERR.puts "Failed to get #{page} #{$!}"
  output.close
  File.delete(file_name)
  raise
end
