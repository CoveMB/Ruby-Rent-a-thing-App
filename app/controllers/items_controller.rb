class ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def create
    p params
    @item = Item.new(cocktails_params)
    @item.user = current_user
    if @item.save
      redirect_to user_path(current_user)
    else
      render :new
    end
  end

  private

  def cocktails_params
    params.require(:item).permit(:title, :description, :image, :category_id)
  end
end
