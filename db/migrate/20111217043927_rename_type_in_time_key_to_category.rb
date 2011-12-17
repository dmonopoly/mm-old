class RenameTypeInTimeKeyToCategory < ActiveRecord::Migration
  def up
    rename_column :time_keys, :type, :category
  end

  def down
    rename_column :time_keys, :category, :type
  end
end
