class RoomsController < ApplicationController

  def index
  end

  def new
    @room = Room.new
  end

  def create
    upload_file_name = nil
    
    if params[:room][:room_image]
      upload_file = params[:room][:room_image]
      extension = File.extname(upload_file)
      upload_file_name = random_string(20)
      upload_file_path = "app/assets/images/room_images/#{upload_file_name + extension}"
      File.binwrite(upload_file_path, upload_file.read)
    end

    new_params = params.require(:room).permit(:name, :intro, :price, :place).merge({image_name: upload_file_name, user_id: current_user.id})
    @room = Room.new(new_params)
    
    if @room.save
      redirect_to room_path(@room.id)
    else
      if upload_file_path.present? 
        File.delete(upload_file_path)
      end
      render "rooms/new"
    end
  end

  def show
    @room = Room.find(params[:id])
    @reservation = Reservation.new
    @owner = User.find(@room.user_id)
  end

  def edit

  end

  def update

  end

  def destroy

  end

  def posts

  end

  def search
    @rooms = Room.where("name LIKE ?", "%#{params[:keyword]}%").where("place LIKE ?", "%#{params[:place]}%")
  end
end
