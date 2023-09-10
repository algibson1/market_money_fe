require "rails_helper"

RSpec.describe MarketsFacade do
  it "can return all markets" do
    markets = MarketsFacade.new.all_markets

    markets.each do |market|
      expect(market).to be_a(Market)
      expect(market.id).to be_a(String)
      expect(market.name).to be_a(String)
      expect(market.city).to be_a(String)
      expect(market.state).to be_a(String)
      expect(market.street).to be_a(String)
      expect(market.zip).to be_a(String)
    end
  end

  it "can return one market" do
    market = MarketsFacade.new.find_market("322458")

    expect(market).to be_a(Market)
    expect(market.id).to be_a(String)
    expect(market.name).to be_a(String)
    expect(market.city).to be_a(String)
    expect(market.state).to be_a(String)
    expect(market.street).to be_a(String)
    expect(market.zip).to be_a(String)
  end
end