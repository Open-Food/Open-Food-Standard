class CreateFoods < ActiveRecord::Migration
  def up
    create_table :foods do |t|
      t.string :name
      t.string :uuid
      t.timestamps
    end

    add_index :foods, :uuid
    add_index :foods, :name
  end

  def down
    drop_table :foods
  end
end
