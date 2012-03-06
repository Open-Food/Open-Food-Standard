class ChangeTableThingsToFoods < ActiveRecord::Migration
  def up
    rename_table :things, :foods
    rename_column :properties, :thing_id, :food_id
  end

  def down
    rename_table :foods, :things
    rename_column :properties, :food_id, :thing_id
  end
end
