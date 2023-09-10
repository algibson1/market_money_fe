require "rails_helper"

RSpec.describe Market do
  it "has an id, name, street, city, county, state, and zip" do
    market = Market.new({
      "id": "322482",
      "type": "market",
      "attributes": {
        "name": "39 North Marketplace",
        "street": "Downtown Sparks Victorian Ave",
        "city": "Sparks",
        "county": "Washoe",
        "state": "Nevada",
        "zip": "89431",
        "lat": "39.534773",
        "lon": "-119.754962",
        "vendor_count": 5
        }
      })

    expect(market.id).to eq("322482")
    expect(market.name).to eq("39 North Marketplace")
    expect(market.street).to eq("Downtown Sparks Victorian Ave")
    expect(market.city).to eq("Sparks")
    expect(market.state).to eq("Nevada")
    expect(market.zip).to eq("89431")
  end

  it "returns nil data as 'unknown'" do
    market = Market.new({
      "id": "322482",
      "type": "market",
      "attributes": {
        "name": "39 North Marketplace",
        "street": nil,
        "city": nil,
        "county": nil,
        "state": nil,
        "zip": nil,
        "lat": nil,
        "lon": nil,
        "vendor_count": 5
        }
      })

      expect(market.street).to eq("Unknown Street")
      expect(market.city).to eq("Unknown City")
      expect(market.state).to eq("Unknown State")
      expect(market.zip).to eq("Unknown Zip")
  end
end