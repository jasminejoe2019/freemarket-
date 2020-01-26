class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
    @category_parent_array = ["--"]
    #データベースから、親カテゴリーのみ抽出し、配列化
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
    end
  end

  def get_category_children
    @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
  end

  def get_category_grandchildren
  #選択された子カテゴリーに紐付く孫カテゴリーの配列を取得
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end

  def get_size
    @sizes = Size.all
  end

  def create
    @item = Item.new(item_params)
    # binding.pry
    if @item.save!
    end
    redirect_to "/"
  end


  private

  def item_params
    params.require(:item).permit(:name, :description, :category_id, :condition_id, :shipping_charge_id, :estimated_shipping_date_id, :price, :size_id).merge(user_id: 2, brand_id: 1, status_id: 1, delivery_area_id: 1, shipping_method_id: 1)
  end

end
