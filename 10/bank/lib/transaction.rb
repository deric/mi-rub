
class Transaction
  attr_reader :source_account, :dest_account, :money

  def initialize(source_account, dest_account, money)
    @source_account, @dest_account, @money = source_account, dest_account, money
  end

  def to_s
    "Transaction from ##{@source_account.id} to ##{@dest_account.id}, amount: #{money.to_s}"
  end
end
