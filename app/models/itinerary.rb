class Itinerary < ApplicationRecord

  include AlgoliaSearch

  algoliasearch do
  end

  ACTIVITIES_MAPPING = {"skitouring" => "Ski de randonnée",
                        "snow_ice_mixed" => "Mixte et glace",
                        "mountain_climbing" => "Alpinisme",
                        "rock_climbing" => "Grande voie",
                        "ice_climbing" => "Cascade de glace"
                       }

  has_many :trips, dependent: :destroy
  validates :title, presence: true
  geocoded_by :address, latitude: :coord_lat, longitude: :coord_long # ActiveRecord
  # after_validation :geocode, if: :will_save_change_to_address?
end
