require 'rails_helper'

RSpec.describe "Shop::Homes", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/shop/home/index"
      expect(response).to have_http_status(:success)
    end
  end

end
