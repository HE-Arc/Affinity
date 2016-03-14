class CreateAttributesTable < ActiveRecord::Migration
  def change
    create_table :attributes do |t|
      t.string :name
      t.timestamps
    end
  end
    def down
        drop_table :attributes
    end
end
