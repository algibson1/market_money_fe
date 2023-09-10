class VendorsController < ApplicationController 
  def show 
    @vendor = facade.find_vendor(params[:id])
  end

  private

  def facade 
    @_facade ||= VendorsFacade.new
  end
end