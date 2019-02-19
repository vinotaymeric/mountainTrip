class User < ApplicationRecord
  has_many :trips, dependent: :destroy
  has_many :user_trips
  has_many :messages
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :user_name, presence: true
end
