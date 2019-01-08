class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :money, :admin
  has_many :user_items
  has_many :items, :through => :user_items
end
