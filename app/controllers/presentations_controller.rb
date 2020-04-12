class PresentationsController < ApplicationController
  def coffee
    render :coffee, :layout => false
  end
end
