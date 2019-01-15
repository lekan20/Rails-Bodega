class User < ActiveRecord::Base
  has_secure_password

  has_many :user_items
  has_many :items, :through => :user_items

  accepts_nested_attributes_for :user_items

  def cart_quantity
    # Gives the total quantity of items of a user
    self.user_items.sum do |user_item|
      user_item.quantity
    end
  end

  def cart_price
    # Adds up the total price of the users item
    self.user_items.sum do |user_item|
      Item.find(user_item.item_id).price * user_item.quantity
    end
  end


end
