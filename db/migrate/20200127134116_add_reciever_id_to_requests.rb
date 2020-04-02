class AddRecieverIdToRequests < ActiveRecord::Migration[5.2]
  def change
    add_column :requests, :reciever_id, :integer
  end
end
