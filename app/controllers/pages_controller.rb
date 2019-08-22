class PagesController < ApplicationController
  skip_before_action :authenticate_user!
  def home
    @items = Item.includes(:user)
    @geocoded = @items.filter { |item| item.user.longitude && item.user.latitude }
    @markers = @geocoded.map do |item|
      {
        lat: item.user.latitude,
        lng: item.user.longitude
      }
    end
    @categories = Category.all
  end
end
