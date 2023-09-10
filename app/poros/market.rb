class Market 
  attr_reader :id,
              :name,
              :street,
              :city,
              :state,
              :zip

  def initialize(data)
    @id = data[:id]
    @name = data[:attributes][:name]
    @street = data[:attributes][:street] || "Unknown Street"
    @city = data[:attributes][:city] || "Unknown City"
    @state = data[:attributes][:state] || "Unknown State"
    @zip = data[:attributes][:zip] || "Unknown Zip"
  end
end