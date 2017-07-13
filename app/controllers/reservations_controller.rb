class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:destroy]

  def destroy
    @reservation.destroy
    redirect_to user_path(@user)
  end

  private
    def set_reservation
      @reservation = Reservation.find(params[:id])
      @user = @reservation.user
    end
end
