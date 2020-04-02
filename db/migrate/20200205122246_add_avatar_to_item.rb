class AddAvatarToItem < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :avatar, :text
  end
end
