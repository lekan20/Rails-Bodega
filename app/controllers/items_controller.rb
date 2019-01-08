class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

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
    @item = Item.new
  end

  def edit
  end

  def create
    @item = Item.new(item_params)
    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: 'Item was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to @item, notice: "Item was successfully updated."}
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    # Delets the purchasing you're looking at in the purchases#show view
    Item.find(params[:id]).destroy
    respond_to do |format|
      format.html { redirect_to items_url, notice: 'Item was successfully destroyed.'}
    end
  end

  def highestprice
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def items_params
    params.require(:item).permit(
      :name,
      :price,
      :quantity
    )
  end
end
