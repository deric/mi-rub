#!/usr/bin/env ruby

class Dictionary
  DFILE = '/usr/share/dict/words'
  DICT = File.readlines(DFILE).map do |line|
    line.chomp.downcase
  end

  def self.size
    DICT.size
  end
end

puts "Dictionary size: #{Dictionary.size}"