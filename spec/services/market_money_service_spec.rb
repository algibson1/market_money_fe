require "rails_helper"

RSpec.describe MarketMoneyService, :vcr do
  it "connects to Market Money API" do
    service = MarketMoneyService.new
    expect(service.connection).to be_a(Faraday::Connection)
  end

  it "returns all markets" do
    service = MarketMoneyService.new
    response = service.all_markets 
    market_data = JSON.parse(response.body, symbolize_names: true)

    market_data[:data].each do |market_hash|
      expect(market_hash).to have_key(:id)
      expect(market_hash).to have_key(:attributes)
      expect(market_hash[:attributes]).to have_key(:name)
      expect(market_hash[:attributes]).to have_key(:street)
      expect(market_hash[:attributes]).to have_key(:city)
      expect(market_hash[:attributes]).to have_key(:state)
      expect(market_hash[:attributes]).to have_key(:zip)
    end
  end

  it "returns one market by ID" do
    service = MarketMoneyService.new
    response = service.find_market("322458")
    market_data = JSON.parse(response.body, symbolize_names: true)

    market_hash = market_data[:data]
    expect(market_hash).to have_key(:id)
    expect(market_hash).to have_key(:attributes)
    expect(market_hash[:attributes]).to have_key(:name)
    expect(market_hash[:attributes]).to have_key(:street)
    expect(market_hash[:attributes]).to have_key(:city)
    expect(market_hash[:attributes]).to have_key(:state)
    expect(market_hash[:attributes]).to have_key(:zip)
  end

  it "returns vendors for a given market" do
    service = MarketMoneyService.new
    response = service.vendors_for("322458")
    vendor_data = JSON.parse(response.body, symbolize_names: true)

    vendor_data[:data].each do |vendor_hash|
      expect(vendor_hash).to have_key(:id)
      expect(vendor_hash).to have_key(:attributes)
      expect(vendor_hash[:attributes]).to have_key(:name)
      expect(vendor_hash[:attributes]).to have_key(:description)
      expect(vendor_hash[:attributes]).to have_key(:contact_name)
      expect(vendor_hash[:attributes]).to have_key(:contact_phone)
      expect(vendor_hash[:attributes]).to have_key(:credit_accepted)
    end
  end
end