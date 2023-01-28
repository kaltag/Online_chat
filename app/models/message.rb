class Message < ApplicationRecord
  belongs_to :user
  belongs_to :room
  has_noticed_notifications

  scope :sorted, -> { order(:id) }
  validates :body, presence: true

  after_create_commit :notify_user

  def notify_user
    MessageNotification.with(message: self).deliver_later(user)
  end
end
