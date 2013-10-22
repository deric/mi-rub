#!/usr/bin/env ruby

File.open("wordlist") do |word_list|
  puts '% Opening file'
  catch (:done) do
    result = []
    while line = word_list.gets
      puts line
      word = line.chomp
      throw :done unless word =~ /^\w+$/
      result << word
    end
    puts result.reverse.to_s
  end
  puts '% Finished'
end
