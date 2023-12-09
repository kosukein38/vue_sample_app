class ShopController < ApplicationController
  after_action :set_csrf_token_header
end
