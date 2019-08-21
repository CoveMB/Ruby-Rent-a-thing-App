class PagesController < ApplicationController
  skip_before_action :authenticate_user!
  def home
    # @items = Item.all
    if params['category']
      @items = Item.where(category_id: params['category'].keys)
    else
      @items = Item.all
    end
    @categories = Category.all

  end
end
