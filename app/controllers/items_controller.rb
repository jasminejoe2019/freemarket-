class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :new, :create]
  before_action -> {set_item(params[:id])},only: [:edit, :update,:show,:destroy,:status_edit]

  def index
    @item = Item.limit(10).order('id DESC')
    @trades = Trade.where(user_id: current_user.id)
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
    respond_to do |format|
      if @item.images.length == 0
        flash[:alert] = '画像は１枚以上登録してください'
        @item.images.build
        @category_parent_array = Category.where(ancestry: nil).pluck(:name)
        @category_parent_array.unshift("--")
        format.html{render :new}
      elsif @item.save
        format.html{redirect_to root_path}
      else
        flash[:alert] = 'エラーが発生しました'
        @item.images.build
        @category_parent_array = Category.where(ancestry: nil).pluck(:name)
        @category_parent_array.unshift("--")
        format.html{render :new}
      end
    end
  end

  def show
    @user = @item.user
    @estimated_shipping_date = EstimatedShippingDate.find(@item.estimated_shipping_date_id)
    @grandchild = Category.find(@item.category_id)
  end

  def edit
    @category_parent_array = @item.category.root
    @category_parent = Category.where(ancestry: nil)
    @grandchild = Category.find(@item.category_id)
    @category_child2 = @grandchild.parent
    @category_child = @item.category.parent.parent.children
    @category_grandchild = @item.category.parent.children
  end

  def status_edit
    @user = @item.user
    update_status = @item.status_id == 1 ? 3 : 1
    flash_message = @item.status_id == 1 ? '商品の出品を停止しました' :'商品の出品を開始しました'

    if @item.update(status_id: update_status)
      flash.now[:notice] = flash_message
      render :show
    else
      flash.now[:alert] = '処理中にエラーが発生しました'
      render :show
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path, notice: '商品が削除されました'
    else
      redirect_to root_path, alert: '商品の削除に失敗しました'
    end
  end

  def update
    @item = Item.find(params[:id])
    respond_to do |format|
      if @item.images.length==0
        flash[:alert] = '画像は１枚以上登録してください'
        @item.images.build
        @category_parent_array = Category.where(ancestry: nil).pluck(:name)
        @category_parent_array.unshift("--")
        format.html{render :edit}
      elsif @item.update(item_params)
        format.html{redirect_to item_path(@item)}
      else
        flash[:alert] = 'エラーが発生しました'
        format.html{render :edit}
      end
    end
  end
  private
  def set_item(params)
    @item = Item.find(params)
  end

  def item_params
    params.require(:item).permit(:name, :description, :category_id, :condition_id, :shipping_charge_id, :estimated_shipping_date_id, :price, :size_id, :brand_name, :delivery_area_id,images_attributes: [:id,:image,:_destroy]).merge(user_id: current_user.id,brand_id: 1,status_id: 1,shipping_method_id: 1)
  end
  def move_to_index
    
  end

end
