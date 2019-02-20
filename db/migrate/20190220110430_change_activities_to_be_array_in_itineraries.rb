class ChangeActivitiesToBeArrayInItineraries < ActiveRecord::Migration[5.2]
  def change
    remove_column :itineraries, :activities
    add_column :itineraries, :activities, :string, array: true, default: []
  end
end
