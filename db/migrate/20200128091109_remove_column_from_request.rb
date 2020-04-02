class RemoveColumnFromRequest < ActiveRecord::Migration[5.2]
  def change
    remove_reference :requests, :user, index: true, foreign_key: true
  end
end
