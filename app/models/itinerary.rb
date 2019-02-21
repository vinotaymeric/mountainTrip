class Itinerary < ApplicationRecord
  has_many :trips, dependent: :destroy
  validates :title, presence: true
  geocoded_by :address, latitude: :coord_lat, longitude: :coord_long # ActiveRecord
  # after_validation :geocode, if: :will_save_change_to_address?
end
