class AddUuidToFoods < ActiveRecord::Migration
  def change
    add_column :foods, :uuid, :string
    add_index :foods, :uuid
  end
end
