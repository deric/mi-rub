require_relative '../money'

class String
  def to_money
    matchdata = self.match(/^(\-?\d+((\.|,)\d+)?) +([a-zA-Z]{3})$/)
    value = matchdata.nil? ? 0 : matchdata[1]
    currency = matchdata.nil? ? :CZK : matchdata[4]
    Money.new(value, currency)
  end
end