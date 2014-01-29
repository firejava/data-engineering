require 'spec_helper'

describe PurchasersController do

  describe "GET index" do

    it "assigns all purchasers as @purchasers" do
      purchaser = Purchaser.create!
      get :index
      expect(assigns(:purchasers)).to eq([purchaser])
    end

  end

  describe "GET show" do

    it "assigns the request purchaser as @purchaser" do
      purchaser = Purchaser.create!
      get :show, id: purchaser.to_param
      expect(assigns(:purchaser)).to eq(purchaser)
    end

  end


end
