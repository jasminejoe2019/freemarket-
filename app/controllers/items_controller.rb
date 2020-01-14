class ItemsController < ApplicationController

  def index
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(item: item_params[:item])
    redirect_to "/new"
  end


  private

  def item_params
    params.permit(:item)
  end

end
