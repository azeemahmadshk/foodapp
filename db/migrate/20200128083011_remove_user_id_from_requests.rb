class RemoveUserIdFromRequests < ActiveRecord::Migration[5.2]
  def change
    remove_reference :requests, :user_id, foreign_key: true
  end
end
