class CreateHeroes < ActiveRecord::Migration
  def change
    create_table :heroes do |t|
      t.text :name
      t.text :display_name
      t.text :uri
      t.timestamps null: false
    end
  end
end
