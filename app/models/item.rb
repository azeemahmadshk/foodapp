class Item < ApplicationRecord
  belongs_to :user
  belongs_to :owner, class_name: 'User', foreign_key: :owner_id

  has_many :senders, class_name: 'Request', foreign_key: :sender_id
  has_many :items, through: :senders

  has_many :recievers, class_name: 'Request', foreign_key: :reciever_id
  has_many :items, through: :recievers



  has_many :item_images
  # mount_uploader :avatar, AvatarUploader

  # has_many :senders, class_name: 'Request', foreign_key: :sender_id
  # has_many :requests, foreign_key: :receiver_id
  # has_many :receivers, through: :requests, class_name: 'Item', foreign_key: :receiver_id
end
