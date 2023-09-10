class MarketsFacade 
  def initialize
    @markets_by_id = {}
  end

  def all_markets 
    @markets ||= parse(get_markets).map { |data| Market.new(data) }
  end

  def find_market(id)
    @markets_by_id[id] ||= Market.new(parse(get_market(id)))
    # better to use all_markets.find { |market| market.id == id } ?
    # Remove find_market method from service?
  end

  private
  
  def service
    @_service ||= MarketMoneyService.new
  end
  
  def parse(response)
    JSON.parse(response.body, symbolize_names: true)[:data]
  end

  def get_markets
    service.all_markets
  end

  def get_market(id)
    service.find_market(id)
  end
end