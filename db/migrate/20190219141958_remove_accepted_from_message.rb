class RemoveAcceptedFromMessage < ActiveRecord::Migration[5.2]
  def change
    remove_column :messages, :accepted, :boolean
  end
end
