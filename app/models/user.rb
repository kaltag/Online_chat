class User < ApplicationRecord
  has_many :rooms, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :notifications, as: :recipient, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
