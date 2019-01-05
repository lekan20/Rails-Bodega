class ItemsController < ApplicationController
  before_action :set_purchase, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.all
    @user = User.find(session[:user_id])
    respond_to do |f|
      f.html { render :index }
      f.json { render json: @items}
    end
  end

  def show
    @item = Item.new
    respond_to do |f|
      f.html { render :show }
      f.json { render json: @item}
    end
  end

  def new
    # can I make this a nested route?
    @item = Item.new
  end

  def edit
  end

  def create
    @item = Item.new(purchase_params)
    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: 'Purchase was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @purchase.update(purchase_params)
        format.html { redirect_to @purchase, notice: "Purchase was successfully updated."}
      else
        format.htnl { render :edit }
      end
    end
  end

  def destroy
    # Delets the purchasing you're looking at in the purchases#show view
    Purchase.find(params[:id]).destroy
    respond_to do |format|
      format.html { redirect_to purchases_url, notice: 'Attraction was successfully destroyed.'}
    end
  end

  def highestprice
  end

  private

  def set_purchase
    @purchase = Purchase.find(params[:id])
  end

  def purchase_params
    params.require(:purchase).permit(
      :name,
      :price,
      :quantity
    )
  end
end
