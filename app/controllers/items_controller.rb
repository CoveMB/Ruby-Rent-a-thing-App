class ItemsController < ApplicationController
  before_action :set_item, only: [:update, :destroy]

  def new
    @item = Item.new
    authorize @item
  end

  def create
    @item = Item.new(items_params)
    @item.user = current_user
    authorize @item
    if @item.save
      flash[:notice] = "Item successfully listed"
      redirect_to user_path(current_user)
    else
      flash[:alert] = "The item could not be listed"
      render :new
    end
  end

  def update
    if @item.update(items_params)
      flash[:notice] = "Item successfully updated"
      redirect_to user_path(current_user)
    else
      flash[:alert] = "Item could not be updated"
      render "users/show"
    end
  end

  def destroy
    if @item.destroy
      flash[:notice] = "Item successfully deleted"
      redirect_to user_path(current_user)
    else
      render "users/show"
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
    authorize @item
  end

  def items_params
    params.require(:item).permit(:title, :description, :image, :category_id, :user_id)
  end
end
