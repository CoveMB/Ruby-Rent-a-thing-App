class UsersController < ApplicationController
  def show
    @user = User.includes(:items).find(params[:id])
    authorize @user
  end
end
