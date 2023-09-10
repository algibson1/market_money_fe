require "rails_helper"

RSpec.describe VendorsFacade, :vcr do
  it "returns all vendors for a market" do
    facade = VendorsFacade.new
    vendors = facade.vendors_for("322482")
    expect(vendors).to be_an(Array)
    expect(vendors).to all be_a(Vendor)
    expect(vendors.count).to eq(5)
    expect(facade.vendors_for("322482")).to eq(vendors)

    vendors.each do |vendor|
      expect(vendor.id).to be_a(String)
      expect(vendor.name).to be_a(String)
      expect(vendor.description).to be_a(String)
      expect(vendor.contact_name).to be_a(String)
      expect(vendor.contact_phone).to be_a(String)
      expect(vendor.credit_accepted).to eq(true).or eq(false)
    end
  end

  it "returns one vendor by id" do
    facade = VendorsFacade.new
    vendor = facade.find_vendor("55747")
    expect(vendor).to be_a(Vendor)
    expect(facade.find_vendor("55747")).to eq(vendor)

    expect(vendor.id).to be_a(String)
    expect(vendor.name).to be_a(String)
    expect(vendor.description).to be_a(String)
    expect(vendor.contact_name).to be_a(String)
    expect(vendor.contact_phone).to be_a(String)
    expect(vendor.credit_accepted).to eq(true).or eq(false)
  end
end