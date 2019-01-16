class CartController < ApplicationController
  def index
    # @items = Item.all
    @user = User.find(params[:user_id])

    respond_to do |f|
      f.html { render :index }
      f.json { render json: @user}
    end

  end

end
