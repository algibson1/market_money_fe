class VendorsFacade
  def initialize 
    @vendors_by_market = {}
  end

  def vendors_for(id)
    @vendors_by_market[id] ||= parse(get_market_vendors(id)).map { |data| Vendor.new(data) }
  end

  private

  def service 
    @_service = MarketMoneyService.new
  end

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)[:data]
  end

  def get_market_vendors(id)
    service.vendors_for(id)
  end
end