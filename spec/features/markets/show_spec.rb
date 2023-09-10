require "rails_helper"

RSpec.describe "Market show page", :vcr do
  before(:each) do
    @market = MarketsFacade.new.find_market("328584")
    visit market_path(@market.id)
  end

  it "has the market's name" do
    expect(page).to have_content("Poynette Area Farmers Market")
  end

  it "has the market's address in readable format" do
    expect(page).to have_content("South Main Street")
    expect(page).to have_content("Poynette, Wisconsin 53955")
  end

  it "has a list of all associated vendors" do
    expect(page).to have_content("Vendors at our Market:")
    expect(all(".vendor").count).to eq(6)
    @market.vendors.each do |vendor|
      expect(page).to have_content(vendor.name)
    end
  end

  it "each listed vendor links to their show page" do
    @market.vendors.each do |vendor|
      expect(page).to have_link(vendor.name, href: vendor_path(vendor.id))
    end
  end
end