
require_relative 'account'
require_relative 'exchange_rates'
require_relative 'money'
require_relative 'transaction'


class Bank
  def initialize
    @accounts = []
    @transactions = []
  end

  def open_account
    @accounts << Account.new
    @accounts.last
  end

  def balance(account)
    account.balance
  end

  def send(source_account, dest_account, money)
    source_account.withdraw(money)
    dest_account.deposit(money)
    @transactions << Transaction.new(source_account, dest_account, money)
  end

  def transactions(account)
    account_transactions = []
    @transactions.each do |trans|
      account_transactions << trans if trans.source_account == account or trans.dest_account == account
    end
    account_transactions
  end

  def exchange(value, currency_from, currency_to)
    ExchangeRates.change(value, currency_from, currency_to)
  end
end
