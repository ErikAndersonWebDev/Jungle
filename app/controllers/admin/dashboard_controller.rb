class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV['USERNAME'], password: ENV['PASSWORD']
  before_action :authorize

  def show
    @products = Product.all
    @categories = Category.all
  end
end
