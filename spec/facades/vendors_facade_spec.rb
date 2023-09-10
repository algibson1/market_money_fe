require "rails_helper"

RSpec.describe VendorsFacade, :vcr do
  it "returns all vendors for a market" do
    facade = VendorsFacade.new
    vendors = facade.vendors_for("322482")
    expect(vendors).to be_an(Array)
    expect(vendors).to all be_a(Vendor)
    expect(vendors.count).to eq(5)
  end
end