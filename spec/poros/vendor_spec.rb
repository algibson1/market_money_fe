require "rails_helper" 

RSpec.describe Vendor do
  it "has a name, description, contact name, contact phone, and credit accepted status" do
    vendor = Vendor.new({
      "id": "55747",
      "type": "vendor",
      "attributes": {
        "name": "Honeycomb",
        "description": "All-natural, honey-based skincare products.",
        "contact_name": "Vicente Collier",
        "contact_phone": "391-350-1645",
        "credit_accepted": true,
        "states_sold_in": [
          "Wisconsin"
        ]
      }
    })

    expect(vendor.id).to eq("55747")
    expect(vendor.name).to eq("Honeycomb")
    expect(vendor.description).to eq("All-natural, honey-based skincare products.")
    expect(vendor.contact_name).to eq("Vicente Collier")
    expect(vendor.contact_phone).to eq("391-350-1645")
    expect(vendor.credit_accepted).to eq(true)
  end
end