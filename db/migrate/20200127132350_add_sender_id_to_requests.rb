class AddSenderIdToRequests < ActiveRecord::Migration[5.2]
  def change
  	 add_column :requests, :sender_id, :integer
  end
end
