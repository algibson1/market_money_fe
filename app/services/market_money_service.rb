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
end