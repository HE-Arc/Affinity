class CreateRelations < ActiveRecord::Migration
  def change
    create_table :relations do |t|
      t.integer :hero_left
      t.integer :hero_right
      t.integer :score

      t.timestamps null: false
    end
  end
end
