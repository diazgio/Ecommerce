class HomeController < ApplicationController
  def index
    @main_categories = Category.take(6)
  end
end