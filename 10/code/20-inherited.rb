class Foo
  def self.inherited(subclass)
    puts "Good news for everyone!"
    puts "#{self} has new subclass #{subclass}"
  end
end

class Bar < Foo
end

class Baz < Bar
end