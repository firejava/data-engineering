require 'spec_helper'

describe ImportsController do

  describe "GET index" do

    it "assigns all imports as @imports" do
      import = Import.create!
      get :index
      expect(assigns(:imports)).to eq([import])
    end

  end

  describe "GET show" do

    it "assigns the request import as @import" do
      import = Import.create!
      get :show, id: import.to_param
      expect(assigns(:import)).to eq(import)
    end

  end

  describe "GET new" do

    it "assigns a new import as @import" do
      get :new
      expect(assigns(:import)).to be_a_new(Import)
    end

    it "responds successfully with an HTTP 200 status code" do
      get :new
      expect(response).to be_success
      expect(response.status).to eq(200)
    end

  end

  describe "POST create" do

    context "with a data file" do

      let(:data_file) { fixture_file_upload "example.tab", "text/plain" }

      it "creates a new import" do
        expect {
          post :create, import: { data: data_file }
        }.to change(Import, :count).by 1
      end

      it "redirects to the the created import" do
        post :create, import: { data: data_file }
        expect(response).to redirect_to action: :show, id: assigns(:import).id
      end

    end

    context "without a data file" do

      it "raises a ActionController::ParameterMissing exception" do
        expect {
          post :create
        }.to raise_error ActionController::ParameterMissing
      end

    end
    
  end

end
