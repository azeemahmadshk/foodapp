class AddOwnerIdToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :owner_id, :integer
  end
end
