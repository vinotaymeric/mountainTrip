class AddContentToItineraries < ActiveRecord::Migration[5.2]
  def change
    add_column :itineraries, :content, :text
  end
end
