
require_relative '../lib/money'


describe Money do
  it "should convert numbers to money" do
    5.to_money.should be_instance_of Money
  end

  it "should convert strings to money" do
    "5 CZK".to_money.should be_instance_of Money
  end

  it "should convert with precision" do
    money = Money.new(200, :USD)
    money.to_czk.to_usd.should eql money
  end

  it "should be summable with numbers" do
    money = Money.new(200, :CZK)
    ("150.0 CZK".to_money + 50).should eql money
    ("150,0 CZK".to_money + 50).should eql money
    ("150 CZK".to_money + 50).should eql money
  end

  it "should be able to convert to other currencies" do
    money = Money.new(200, :CZK)
    expect(money.respond_to?(:to_usd)).to eq true
    expect(money.respond_to?(:to_gbp)).to eq true
    expect(money.respond_to?(:to_chf)).to eq true
    expect(money.respond_to?(:to_pln)).to eq true
    expect(money.respond_to?(:to_nok)).to eq true
    expect(money.respond_to?(:to_ltl)).to eq true
    expect(money.respond_to?(:to_lvl)).to eq true
  end
end
