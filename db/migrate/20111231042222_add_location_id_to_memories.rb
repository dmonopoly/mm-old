class AddLocationIdToMemories < ActiveRecord::Migration
  def change
    add_column :memories, :location_id, :integer
  end
end
