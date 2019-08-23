class PagesController < ApplicationController
  skip_before_action :authenticate_user!
  def home
    if params['search'].present?
      @items = Item.includes(:user).where("title ILIKE ?", "%#{params['search']}%")
      @categories = Category.joins(:items).where(items: {id:@items}).distinct
    else
      @items = Item.all
      @categories = Category.all
    end
    @string = "#{params['search']}"
    @geocoded = @items.filter { |item| item.user.longitude && item.user.latitude }
    @markers = @geocoded.map do |item|
      {
        lat: item.user.latitude,
        lng: item.user.longitude,
        infoWindow: render_to_string(partial: "items/info_window", locals: { item: item })
      }
    end
  end
end
