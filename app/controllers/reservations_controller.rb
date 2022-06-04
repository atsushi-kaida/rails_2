class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all
    @rooms = Room.all
  end

  def new
    @room = Room.find(params[:reservation][:room_id])
    @reservation = Reservation.new(reservation_params)
    @owner = User.find(@room.user_id)
    @total_day = (@reservation.end_day.to_date - @reservation.start_day.to_date).to_i
    render "rooms/show" if @reservation.invalid?
  end

  def create
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      redirect_to reservation_path(@reservation.id)
    else
      redirect_to room_path(@reservation.room_id)
    end
  end
  
  def show
    @reservation = Reservation.find(params[:id])
  end

  def edit

  end

  def update

  end

  def destroy

  end

  private
    def reservation_params
        params.require(:reservation).permit(:start_day, :end_day, :people_count, :room_id)
    end
end
