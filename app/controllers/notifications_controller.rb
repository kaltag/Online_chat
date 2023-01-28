class NotificationsController < ApplicationController
  def index
    @notifications = Notification.where.not(recipient: current_user)
  end

  def destroy
    @notification = Notification.find(params[:id])
    @notification.destroy
  end
end
