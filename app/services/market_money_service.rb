class MarketMoneyService 
  def connection 
    Faraday.new("http://localhost:3000/api/v0")
  end

  def all_markets
    connection.get("markets")
  end

  def find_market(id)
    connection.get("markets/#{id}")
  end

  def vendors_for(id)
    connection.get("markets/#{id}/vendors")
  end

  def find_vendor(id)
    connection.get("vendors/#{id}")
  end
end