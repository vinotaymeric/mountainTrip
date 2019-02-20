class AddStateToUseTrip < ActiveRecord::Migration[5.2]
  def change
    add_column :user_trips, :state, :string
  end
end
