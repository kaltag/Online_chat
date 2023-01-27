class MessagesController < ApplicationController
  def create
    @new_message = current_user&.messages&.build(strong_params)

    return unless @new_message&.save

    @new_message.broadcast_append_to @new_message.room
  end

  private

  def strong_params
    params.require(:message).permit(:room_id, :body)
  end
end
