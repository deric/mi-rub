
require_relative 'exchange_rates'
require_relative 'insufficient_deposit_error'


class Account
  attr_reader :id
  @ids = 0

  class << self
    attr_accessor :ids
  end

  def initialize
    @money = Money.new(0, :CZK)
    Account.ids += 1
    @id = Account.ids
  end

  def deposit(money)
    @money += money
  end

  def withdraw(money)
    raise InsufficientDepositError.new("Not enough money") unless has_at_least?(money)
    @money -= money
  end

  def has_at_least?(money)
    @money >= money
  end

  def balance
    @money
  end
end
