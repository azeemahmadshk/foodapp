class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # has_secure_password
  has_many :items, dependent: :destroy
  has_many :owns, class_name: 'Item', foreign_key: :owner_id
  has_many :requests, dependent: :destroy

end
