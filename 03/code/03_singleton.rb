class Logger
  
  def self.instance
    @@log ||= Logger.new
  end
end

log1 = Logger.instance
puts "logger1 id = %i" % log1.object_id
log2 = Logger.instance
puts "logger2 id = %i" % log2.object_id
