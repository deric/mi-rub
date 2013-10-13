module Debug
  def who_am_i?
    "#{self.class.name} \n
      (\##{self.object_id}): #{self.to_s}"
  end
end

class Phonograph
  include Debug

  def initialize(name)
    @name = name
  end
end

class EightTrack
  include Debug

  def initialize(name)
    @name = name
  end
end

ph = Phonograph.new("West End Blues")
et = EightTrack.new("Surrealistic Pillow")
p ph.who_am_i?
# => "Phonograph (#330450):
#        West End Blues"
p et.who_am_i?
# => "EightTrack (#330420):
#        Surrealistic Pillow"