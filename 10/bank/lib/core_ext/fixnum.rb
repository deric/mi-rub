
class Fixnum
  def to_money
    Money.new(self)
  end
end