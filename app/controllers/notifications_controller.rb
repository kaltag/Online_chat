class NotificationsController < ApplicationController
  def index
    @notifications = Notification.where.not(recipient: current_user)
  end

  def destroy
    @notification = Notification.find(params[:id])
    @notification.destroy
    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.remove("notification_id_#{@notification.id}") }
    end
  end
end
