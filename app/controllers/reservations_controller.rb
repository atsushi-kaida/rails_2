class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all
  end

  def new
    @room = Room.find(params[:room_id])
    @reservation = Reservation.new
    @total_day = (params[:end_day].to_date - params[:start_day].to_date).to_i
  end

  def create
    @reservation = Reservation.new(params.require(:reservation).permit(:start_day, :end_day, :people_count, :room_id))
    if @reservation.save
      redirect_to reservation_path(@reservation.id)
    else
      render "reservation/new"
    end
  end
  def show
    @reservation = Reservation.find(params[:id])
    @room = Room.find(@reservation.room_id)
  end

  def edit

  end

  def update

  end

  def destroy

  end
end
