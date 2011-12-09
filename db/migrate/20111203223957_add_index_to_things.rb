class AddIndexToThings < ActiveRecord::Migration
  def change
    add_index :things, :name
  end
end
