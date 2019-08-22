class PagesController < ApplicationController
  skip_before_action :authenticate_user!
  def home
    @items = Item.includes(:user)
    @categories = Category.all
  end
end
