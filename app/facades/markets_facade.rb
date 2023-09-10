class MarketsFacade 
  def all_markets 
    response = service.all_markets
    parsed = JSON.parse(response.body, symbolize_names: true)
    parsed[:data].map do |data| 
      Market.new(data)
    end
  end

  def find_market(id)
    response = service.find_market(id)
    parsed = JSON.parse(response.body, symbolize_names: true)
    Market.new(parsed[:data])
  end

  def service
    @_service ||= MarketMoneyService.new
  end
end