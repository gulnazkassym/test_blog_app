require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #create" do
    it "returns http success" do
      user = attributes_for :user
      post :create, params: { user: user }
      expect(response).to have_http_status(:redirect)
    end
  end

end
