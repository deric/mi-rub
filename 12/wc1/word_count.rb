require 'thread'

def word_count(file)
  queue = Queue.new
  counts = Hash.new(0)

  # TODO write counter

  counts.keys.sort.each do |k|
    print "#{k}:#{counts[k]} "
  end
  counter.value
end