class ItemsController < ApplicationController
  def index
    @item = Item.limit(10).order('id DESC')
  end

  def new

  end

  # def new
  #   @item = Item.new
  #   @category_parent_array = ["--"]
  #   #データベースから、親カテゴリーのみ抽出し、配列化
  #   Category.where(ancestry: nil).each do |parent|
  #     @category_parent_array << parent.name
  #   end
  #   @item.images.build
  # end

  def show
    @item =Item.find(params[:id])
    @user = User.find(@item.user_id)
    @conditoon = Condition.find(@item.condition_id)
    @shipping_charge = ShippingCharge.find(@item.shipping_charge_id)
    @shipping_method = ShippingMethod.find(@item.shipping_method_id)
    @delivery_area = DeliveryArea.find(@item.delivery_area_id)
    @estimated_shipping_date = EstimatedShippingDate.find(@item.estimated_shipping_date_id)
    @grandchild = Category.find(6)
  end

end
