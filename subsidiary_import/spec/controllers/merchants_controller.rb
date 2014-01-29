require 'spec_helper'

describe MerchantsController do

  describe "GET index" do

    it "assigns all merchants as @merchants" do
      merchant = Merchant.create!
      get :index
      expect(assigns(:merchants)).to eq([merchants])
    end

  end

  describe "GET show" do

    it "assigns the request merchant as @merchant" do
      merchant = Merchant.create!
      get :show, id: merchant.to_param
      expect(assigns(:merchant)).to eq(merchant)
    end

  end


end
