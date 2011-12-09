class CreateThings < ActiveRecord::Migration
  def up
    create_table :things do |t|
      t.string :name
    end
  end

  def down
    drop_table :things
  end
end
