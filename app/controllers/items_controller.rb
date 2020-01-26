class ItemsController < ApplicationController
  def index
    @item = Item.limit(10).order('id DESC')
  end
  def new
    
  end
  def show
  
  end
  def destroy
    
  end

end
