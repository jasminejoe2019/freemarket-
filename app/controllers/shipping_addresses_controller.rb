class ShippingAddressesController < ApplicationController
  before_action :authenticate_user!

  def index
    @shipping_address = ShippingAddress.find_by(user_id: current_user.id)
    if @shipping_address == nil
      @shipping_address = current_user.shipping_addresses.new
    end
  end

  def create
    @shipping_address = ShippingAddress.new(shipping_address_params)
    if @shipping_address.save
      redirect_to root_path, notice: '送付先住所が登録されました'
    else
      render :index
    end
  end

  def edit
    @shipping_address = current_user.shipping_addresses.first
  end

  def update
    @shipping_address = current_user.shipping_addresses.first
    if @shipping_address.update(shipping_address_params)
      redirect_to root_path, notice: '送付先住所が更新されました'
    else
      render :index
    end
  end

  private
  def shipping_address_params
    params.require(:shipping_address).permit(
      :first_name,
      :first_furigana,
      :family_name,
      :family_furigana, 
      :postal_code,
      :prefecture,
      :city,
      :address,
      :building_name,
      :telephone
    ).merge(user_id: current_user.id)
  end
end
