class CreateItineraries < ActiveRecord::Migration[5.2]
  def change
    create_table :itineraries do |t|
      t.string :coord_x
      t.string :coord_y
      t.string :diffculty
      t.integer :elevation_max
      t.integer :height_diff_up
      t.string :engagement_rating
      t.string :equipment_rating
      t.string :activities
      t.string :orientations
      t.integer :number_of_outings
      t.string :title
      t.string :picture_url

      t.timestamps
    end
  end
end
