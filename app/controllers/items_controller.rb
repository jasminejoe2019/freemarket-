class ItemsController < ApplicationController
  def index
    @item = Item.limit(10).order('id DESC')
  end

  def new
    @item = Item.new
    @category_parent_array = Category.where(ancestry: nil).pluck(:name)
    @category_parent_array.unshift("--")
    @item.images.build
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
    if @item.save
      redirect_to root_path
    else
        flash[:alert] = 'エラーが発生しました'
        @category_parent_array = Category.where(ancestry: nil).pluck(:name)
        @category_parent_array.unshift("--")
        render :new
    end
  end

  def show
    # binding.pry
    @item =Item.find(params[:id])
    @user = @item.user
    @estimated_shipping_date = EstimatedShippingDate.find(@item.estimated_shipping_date_id)
    @grandchild = Category.find(@item.category_id)
  end


  private

  def item_params
    params.require(:item).permit(:name, :description, :category_id, :condition_id, :shipping_charge_id, :estimated_shipping_date_id, :price, :size_id,:brand_id, :delivery_area_id,images_attributes: [:image]).merge(user_id: current_user.id,brand_id: 1,status_id: 1,shipping_method_id: 1)
  end

end
