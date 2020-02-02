class ItemsController < ApplicationController
  def index
    @item = Item.limit(10).order('id DESC')
  end

  def new

  end

  def show
    @item =Item.find(params[:id])
    @user = User.find(@item.user_id)
    @grandchild = Category.find(6)
  end

end
