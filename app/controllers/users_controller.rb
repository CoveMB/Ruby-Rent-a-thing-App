class UsersController < ApplicationController
  def show
    @user = User.includes(:items, :reservations_made_on_other_items, :reservations_on_own_items).find(params[:id])
    authorize @user
  end
end
