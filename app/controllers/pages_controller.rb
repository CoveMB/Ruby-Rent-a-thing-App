class PagesController < ApplicationController
  skip_before_action :authenticate_user!
  def home
    @items = Item.all
    @categories = Category.all
  end
end
