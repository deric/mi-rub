
require_relative '../lib/bank'


describe Bank do
  before(:each) do
    @bank = Bank.new
  end

  it "should allow to open new account" do
    @bank.should respond_to(:open_account)
    @bank.open_account.should be_instance_of(Account)
  end

  it "should allow to check account balance" do
    account = @bank.open_account
    @bank.balance(account).should eql account.balance
  end

  it "should allow money transactions" do
    acc1 = @bank.open_account
    acc2 = @bank.open_account
    acc1.deposit( Money.new(1000, :USD) )
    acc1.balance.should eql Money.new(1000, :USD)
    @bank.send(acc1, acc2, Money.new(200, :USD) )
    acc1.balance.should eql Money.new(800, :USD)
    acc2.balance.should eql Money.new(200, :USD)
  end

  it "should not allow transfer if account money amount is not high enough" do
    acc1 = @bank.open_account
    acc2 = @bank.open_account
    acc1.deposit( Money.new(1, :CZK) )
    lambda { @bank.send(acc1, acc2, Money.new(200, :USD) ) }.should raise_error InsufficientDepositError
  end

  it "should keep records of executed transactions" do
    acc1 = @bank.open_account
    acc2 = @bank.open_account
    acc1.deposit( Money.new(1000, :CZK) )
    acc2.deposit( Money.new(1000, :CZK) )
    @bank.send(acc1, acc2, Money.new(50, :CZK) )
    @bank.send(acc1, acc2, Money.new(150, :CZK) )
    @bank.send(acc2, acc1, Money.new(100, :CZK) )

    acc1.balance.should eql Money.new(900, :CZK)
    acc2.balance.should eql Money.new(1100, :CZK)

    @bank.transactions(acc1).size.should be 3
    @bank.transactions(acc2).size.should be 3
  end

  it "should exchange money in specified currency" do
    five_dollars = Money.new(5, :USD)
    five_dollars_in_czk = five_dollars.to_czk
    five_dollars_in_czk_raw = @bank.exchange(5, :USD, :CZK)
    five_dollars_in_czk.value.should eql five_dollars_in_czk_raw
  end
end
