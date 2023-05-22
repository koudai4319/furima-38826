class ItemsController < ApplicationController

  before_action :authenticate_user!, except: [:index]

  def index
    @items = Item.include(:user)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

end
