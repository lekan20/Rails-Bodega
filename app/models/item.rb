class Item < ActiveRecord::Base
  has_many :user_items
  has_many :users, :through => :user_items

  accepts_nested_attributes_for :user_items

  def self.most_expensive
    order("price DESC").first
  end

  def self.least_expensive
    order("price ASC").first
  end

  def self.average_price
    average("price")
  end

end
