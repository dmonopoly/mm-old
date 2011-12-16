class AddTypeToTimeKeys < ActiveRecord::Migration
  def change
    add_column :time_keys, :type, :integer
  end
end
