class RoomsController < ApplicationController
  def index
    @rooms = Room.all
    @new_room = Room.new
  end

  def create
    @new_room = current_user&.rooms&.build

    return unless @new_room&.save

    @new_room.broadcast_append_to :rooms
  end

  def show
    @room = Room.find_by!(title: params[:title])
    @messages = @room.messages
    @new_message = current_user&.messages&.build
  end
end
