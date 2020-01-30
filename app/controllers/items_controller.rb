class ItemsController < ApplicationController
  def index
    @item = Item.limit(10).order('id DESC')
  end
  def new
    
  end
  def show
    @item =Item.find(params[:id])
    @user = User.find(@item.user_id)
    @conditoon = Condition.find(@item.condition_id)
    @shipping_charge = ShippingCharge.find(@item.shipping_charge_id)
    @shipping_method = ShippingMethod.find(@item.shipping_method_id)
    @delivery_area = DeliveryArea.find(@item.delivery_area_id)
    @estimated_shipping_date = EstimatedShippingDate.find(@item.estimated_shipping_date_id)
  end

end
