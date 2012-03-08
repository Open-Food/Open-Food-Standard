class CreateProperties < ActiveRecord::Migration
  def up
    create_table :properties do |t|
      t.string :name
      t.string :value
      t.integer :food_id
      t.timestamps
    end

    add_index :properties, :food_id
  end

  def down
    drop_table :properties
  end
end
