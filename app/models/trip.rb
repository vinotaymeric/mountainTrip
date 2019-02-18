class Trip < ApplicationRecord
  belongs_to :user
  belongs_to :itinerary
  has_many :user_trips
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :user_id, presence: true
  validates :itinerary_id, presence: true
end
