class UserItem < ActiveRecord::Base
  belongs_to :user
  belongs_to :item

  # Create a new method to store value to store purchase value to order items

  def buy_item
    # This uses the other methods to let the user know if they can buy the item and updates the purchases info
    # Can I associate the purchase here with an order_item? Can I create a new order item from this model?
    enough_money, still_in_stock = meet_requirements
    if enough_money && still_in_stock
      update_puchase
    elsif still_in_stock && !enough_money
      "Sorry. " + not_enough_money
    elsif enough_money && !still_in_stock
      no_more_in_stock
    end
  end


  def meet_requirements
    # Uses the join table to test if the user has enough money to buy the purchase.
    enough_money, still_in_stock = false
    if self.user.money >= self.item.price
      enough_money = true
    end
    if self.item.quantity > 0
      still_in_stock = true
    end
    return [enough_money, still_in_stock]
  end

  def update_puchase
    # Update that properties of a Purchase and save it
    new_quantity = self.item.quantity - 1
    new_money = self.user.money - self.item.price
    self.user.update(
      :money => new_money
    )
    self.item.update(
      :quantity => new_quantity
    )
  end

  def not_enough_money
    # If you don't have enough money,
    "You don't have enough money to buy #{self.item.name}"
  end

  def no_more_in_stock
    # If the purchase isn't in stock you can't buy it.
    "Sorry, there are no more #{self.item.name} in stock"
  end


end
