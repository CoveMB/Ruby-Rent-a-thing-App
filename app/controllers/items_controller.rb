class ItemsController < ApplicationController
  before_action :set_item, only: [:update, :destroy]

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(items_params)
    @item.user = current_user
    if @item.save
      redirect_to user_path(current_user)
    else
      render "users/show"
    end
  end

  def update
    if @iten.update(items_params)
      redirect_to user_path(current_user)
    else
      render "users/show"
    end
  end

  def destroy
    if @item.destroy
      redirect_to user_path(current_user)
    else
      render "users/show"
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def items_params
    params.require(:item).permit(:title, :description, :image, :category_id)
  end
end
