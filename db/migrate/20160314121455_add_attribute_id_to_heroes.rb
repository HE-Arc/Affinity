class AddAttributeIdToHeroes < ActiveRecord::Migration
  def change
    add_column :heroes, :attribute_id, :integer
    add_index :heroes, :attribute_id
  end
end
