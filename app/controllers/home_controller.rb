class HomeController < ApplicationController
  before_action :set_variables, only: [:index, :create_reservation]
  def index
    @reservation = params[:reservation] ? Reservation.new(reservation_params) : Reservation.new
  end
  def about
    
  end

  def create_reservation
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      flash[:success] = "Reservation successfully created" 
      redirect_to action: 'index', date: params[:reservation][:start_date].to_date, reservation: reservation_params
    else
      flash[:error] = @reservation.errors.full_messages.to_sentence 
      redirect_to action: 'index', date: params[:reservation][:start_date].to_date, reservation: reservation_params
    end
  end

  private 
    def reservation_params
      params.require(:reservation).permit(:car_id, :user_id, :start_date, :end_date)
    end

    def set_variables
      @current_date = params[:date].blank? ? Date.today : params[:date].to_date
      @cars = Car.all
      @users = User.all
      @reservations = Reservation.where('"start_date" >= ? AND "end_date" <= ?', @current_date.beginning_of_day, @current_date.end_of_day).order(:start_date)
    end
end
