class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:show, :destroy, :update]

  def create
    p "****************************"
    p params
    @reservation = Reservation.new(user: current_user)
    @reservation.item = Item.find(params[:item_id])
    authorize @reservation
    if @reservation.save
      flash[:notice] = "You'r renting a thing!"
      redirect_to user_path(current_user)
    else
      render "users/show"
    end
  end

  def update
    if params[:status] == "accept"
      @reservation.status = "Accepted"
    elsif params[:status] == "reject"
      @reservation.status = "Rejected"
    end
    if @reservation.save
      flash[:notice] = "Reservation successfully updated"
      redirect_to user_path(current_user)
    else
      render "users/show"
    end
  end

  def destroy
    if @reservation.destroy
      flash[:notice] = "Reservation successfully deleted"
      redirect_to user_path(current_user)
    else
      render "users/show"
    end
  end

  private

  def set_reservation
    @reservation = Reservation.find(params[:reservation_id])
    authorize @reservation
  end

  # def reservations_params
  #   params.require(:reservation).permit(:user_id)
  # end
end
