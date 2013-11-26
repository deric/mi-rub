
require 'bigdecimal'
require_relative 'exchange_rates'
require_relative 'core_ext/string'
require_relative 'core_ext/fixnum'

class Money
  include Comparable

  attr_reader :value, :currency

  def initialize(value, currency = :CZK)
    @currency = currency.to_sym
    @value = BigDecimal.new(value)
  end

  def +(money)
    Money.new(@value + object_value(money), @currency)
  end

  def -(money)
    Money.new(@value - object_value(money), @currency)
  end

  def <=>(money)
    @value <=> object_value(money)
  end

  def eql?(money)
    self == money
  end

  def ==(money)
    @value == object_value(money)
  end

  def to_s
    "#{@value.to_f} #{@currency.to_s}"
  end

  private
  def object_value(money)
    if money.kind_of? Fixnum or money.kind_of? Float
      money
    else
      money_with_same_currency(money).value
    end
  end

  def money_with_same_currency(money)
    if @currency != money.currency
      value = ExchangeRates.change(money.value, money.currency, @currency)
      money = Money.new(value, @currency)
    end
    money
  end
end

