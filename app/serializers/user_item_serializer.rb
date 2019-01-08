class UserItemSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :item_id, :quantity
  belongs_to :user
  belongs_to :item
end
