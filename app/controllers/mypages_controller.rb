class MypagesController < ApplicationController
  def index
    @trades = Trade.where(user_id: current_user.id).limit(3)
  end

  def edit
  end

  def selling_item_list
    @items = Item.where(user_id: current_user.id)
  end

  def purchase_list
    @trades = Trade.where(user_id: current_user.id)
  end
end
