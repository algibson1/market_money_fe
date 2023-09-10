require "rails_helper"

RSpec.describe "Vendor show page", :vcr do
  before(:each) do
    @vendor = Vendor.new({
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

    visit vendor_path(@vendor.id)
  end

  it "has the vendor's name" do
    expect(page).to have_content("Honeycomb")
    save_and_open_page
  end

  it "has the contact info" do
    expect(page).to have_content("Contact Info:")
    expect(page).to have_content("Name: Vicente Collier")
    expect(page).to have_content("Phone: 391-350-1645")
  end

  it "says whether or not credit is accepted" do
    expect(page).to have_content("Credit Accepted?: YES")
  end

  it "has a description of what they sell" do
    expect(page).to have_content("Description: All-natural, honey-based skincare products.")
  end
end