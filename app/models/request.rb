class Request < ApplicationRecord
	enum status: [:accepted,:rejected,:pending]

	belongs_to :reciever, class_name: "Item", foreign_key: "reciever_id"
	belongs_to :sender, class_name: "Item", foreign_key: "sender_id"
	belongs_to :users
end
