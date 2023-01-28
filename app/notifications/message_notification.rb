class MessageNotification < Noticed::Base
  deliver_by :database

  param :message

  def message
    params[:message].body
  end

  def url
    room_path(params[:room_id])
  end
end
