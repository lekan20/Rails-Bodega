class UserItemsController < ApplicationController

  def new
     # Join table method that creates a new item that connects a user to a purchase
    @user_item = UserItem.find_by(:user_id => params[:user_id], :item_id => params[:item_id])
    if @user_item == nil
      @user_item = UserItem.create(
        :user_id => params[:user_id],
        :item_id => params[:item_id],
        :quantity => 1
      )
    else
      @user_item.quantity += 1
      @user_item.save
      # make sure quantity going up by 1
      # go to item index for a user and show the quantity,
      # Make an edit link next to item, click edit, item show page, and only thing you can change is the quantity, prepopulated input field
    end
    @message = @user_item.buy_item
    redirect_to user_path(@user_item.user, :message => @message)
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(quantity: params[:item][:quantity])
    redirect_to user_cart_index_url(current_user)
  end

end
