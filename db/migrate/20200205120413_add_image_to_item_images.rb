class AddImageToItemImages < ActiveRecord::Migration[5.2]
  def change
    add_column :item_images, :image, :text
  end
end
