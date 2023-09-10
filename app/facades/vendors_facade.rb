class VendorsFacade
  def initialize 
    @vendors_by_market = {}
    @vendors_by_id = {}
  end

  def vendors_for(id)
    @vendors_by_market[id] ||= parse(get_market_vendors(id)).map { |data| Vendor.new(data) }
  end

  def find_vendor(id)
    @vendors_by_id[id] ||= Vendor.new(parse(get_vendor(id)))
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

  def get_vendor(id)
    service.find_vendor(id)
  end
end