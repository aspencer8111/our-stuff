require 'rails_helper'

RSpec.describe ItemsController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "returns items" do
      items = 5.times { Item.create(name: "Thing", description: "A thing!") }
      get :index
      expect(assigns(:items).count).to eq(items)
    end
  end
end
