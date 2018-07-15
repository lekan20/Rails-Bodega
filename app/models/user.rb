class User < ActiveRecord::Base
  has_secure_password

  has_many :items
  has_many :purchases, :through => :items

  accepts_nested_attributes_for :items

  def num_of_items
    self.purchases.count
  end

  def cart
    # Shows the collection of purchases the user has
    self.purchases.each do |purchase|
      purchase.name
    end
  end

  def cart_total
    # Gives the total price of all the purchases the user made
    self.purchases.sum do |purchase|
      purchase.price
    end
  end
end
