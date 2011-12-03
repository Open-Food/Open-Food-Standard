class CreateProperties < ActiveRecord::Migration
  def up
    create_table :properties do |t|
      t.timestamps
      t.string :name
      t.string :value
      t.integer :thing_id
    end
    add_index :properties, :thing_id
  end

  def down
    drop_table :properties
  end
end
