class ItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :price, :quantity
  has_many :user_items
  has_many :users, :through => :user_items
end
