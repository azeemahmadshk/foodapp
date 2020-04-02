class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
      t.string :item_type
      t.string :description
      t.integer :points
      t.text :picture

      t.timestamps
    end
  end
end
