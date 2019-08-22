class PagesController < ApplicationController
  skip_before_action :authenticate_user!
  def home
    if params['search'].present?
      @items = Item.where("title ILIKE ?", "%#{params['search']}%")
      @categories = Category.joins(:items).where(items: {id:@items}).distinct
    else
      @items = Item.all
      @categories = Category.all
    end
    @string = "You searched for #{params['search']}"
  end
end
