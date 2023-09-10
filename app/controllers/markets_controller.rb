class MarketsController < ApplicationController 
  def index 
    @markets = facade.all_markets
  end

  private

  def facade 
    @_facade ||= MarketsFacade.new
  end
end