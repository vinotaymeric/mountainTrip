class Itinerary < ApplicationRecord
  has_many :trips, dependent: :destroy
  validates :title, presence: true
end
