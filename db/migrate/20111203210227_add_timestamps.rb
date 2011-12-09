class AddTimestamps < ActiveRecord::Migration
  def up
    change_table :things do |t|
      t.timestamps
    end
  end

  def down
    change_table :things do |t|
      t.remove_column :created_at
      t.remove_column :updated_at
    end
  end
end
