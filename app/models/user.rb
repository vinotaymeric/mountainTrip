class User < ApplicationRecord
  has_many :trips, dependent: :destroy
  has_many :user_trips
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end


  # validates :name, presence: true, uniqueness: true
  # has_many :doses, dependent: :destroy
  # has_many :ingredients, through: :doses
  # mount_uploader :photo, PhotoUploader
