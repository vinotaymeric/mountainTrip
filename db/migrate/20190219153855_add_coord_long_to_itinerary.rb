class AddCoordLongToItinerary < ActiveRecord::Migration[5.2]
  def change
    add_column :itineraries, :coord_long, :float
    add_column :itineraries, :coord_lat, :float
  end
end
