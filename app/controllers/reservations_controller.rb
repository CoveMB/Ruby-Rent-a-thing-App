class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:show, :destroy]

  def show
  end

  def create
    @reservation = Reservation.new(reservations_params)
    @reservation.user = current_user
    @reservation.item = Item.find(params[:item_id])
    if @reservation.save
      redirect_to user_path(current_user)
    else
      render "users/show"
    end
  end

  def destroy
    if @reservation.destroy
      redirect_to user_path(current_user)
    else
      render "users/show"
    end
  end

  private

  def set_reservation
    @reservation = Reservation.find(params[:reservation_id])
  end

  def reservations_params
    params.require(:reservation).permit(:user_id)
  end
end
