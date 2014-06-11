class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  has_many :tasks
  validates :name, :email, presence: true
  validates :email, uniqueness: true

  SUBSCRIPTIONS = [
    OpenStruct.new(type: "free", price: "", display_name: "Free"),
    OpenStruct.new(type: "silver", price: "$9.99", display_name: "Silver $9.99/mo"),
    OpenStruct.new(type: "gold", price: "$19.99", display_name: "Gold $19.99/mo"),
  ]
end
