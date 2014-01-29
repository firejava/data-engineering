class PurchasersController < ApplicationController

  def index
    @purchasers = Purchaser.all
  end

  def show
    @purchaser = Purchaser.find params[:id]
  end

end
