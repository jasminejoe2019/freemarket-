class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :new, :create]

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
    @item =Item.find(params[:id])
    @user = @item.user
    @estimated_shipping_date = EstimatedShippingDate.find(@item.estimated_shipping_date_id)
    @grandchild = Category.find(params[:id])
  end

  def status_edit
    @item = Item.find(params[:id])
    @user = current_user
      if @item.status_id == 1
        if @item.update!(status_id: 3)
          flash.now[:notice] = '商品の出品を停止しました'
          render :show
        else
          flash.now[:alert] = '出品停止処理中にエラーが発生しました'
          render :show
        end
      elsif @item.status_id == 3
        if @item.update(status_id: 1)
          flash.now[:notice] = '商品の出品を開始しました'
          render :show
        else
          flash.now[:alert] = '出品開始処理中にエラーが発生しました'
          render :show
        end
      end
  end

  def destroy
    @item = Item.find(params[:id])
    if @item.destroy
      redirect_to root_path, notice: '商品が削除されました'
    else
      redirect_to root_path, alert: '商品の削除に失敗しました'
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :category_id, :condition_id, :shipping_charge_id, :estimated_shipping_date_id, :price, :size_id,:brand_id, :delivery_area_id,images_attributes: [:image]).merge(user_id: current_user.id,brand_id: 1,status_id: 1,shipping_method_id: 1)
  end

  def move_to_index
    redirect_to root_path, alert: '指定された商品は存在しません' unless @item = Item.exists?(params[:id])
  end

end
