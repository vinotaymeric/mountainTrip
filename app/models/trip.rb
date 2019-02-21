class Trip < ApplicationRecord
  belongs_to :user
  belongs_to :itinerary
  has_many :user_trips, dependent: :destroy
  has_many :messages, dependent: :destroy
  validates :start_date, presence: true
  validates :end_date, presence: true
end
