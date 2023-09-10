class MarketsController < ApplicationController 
  def index 
    @markets = facade.all_markets
  end

  def show
    @market = facade.find_market(params[:id])
  end

  private

  def facade 
    @_facade ||= MarketsFacade.new
  end
end