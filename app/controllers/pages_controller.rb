class PagesController < ApplicationController
  skip_before_action :authenticate_user!
  def home
    @items = Item.includes(:user)
    @geocoded = @items.filter { |item| item.user.longitude && item.user.latitude }
    p "************************************"
    p @geocoded
    @markers = @geocoded.map do |item|
      p "&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&"
      p item
      p item.user
      {
        lat: item.user.latitude,
        lng: item.user.longitude,
        infoWindow: render_to_string(partial: "items/info_window", locals: { item: item })
      }
    end
    @categories = Category.all
  end
end
