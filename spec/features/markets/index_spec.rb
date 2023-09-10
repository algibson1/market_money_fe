require "rails_helper"

RSpec.describe "Markets Index Page", :vcr do
  before(:each) do
    @markets = MarketsFacade.new.all_markets
    visit "/markets"
  end

  it "has all markets listed with name, city, and state" do
    expect(page).to have_content("Markets")
    expect(page).to have_content("Name")
    expect(page).to have_content("City")
    expect(page).to have_content("State")

    @markets.each do |market|
      within("#market-#{market.id}") do
        expect(page).to have_content(market.name)
        expect(page).to have_content(market.city)
        expect(page).to have_content(market.state)
        expect(page).to have_button("More Info")
      end
    end
  end

  it "links to each market's show page" do
    market = @markets.sample 

    within("#market-#{market.id}") do
      click_button("More Info")
    end

    expect(current_path).to eq("/markets/#{market.id}")
  end
end