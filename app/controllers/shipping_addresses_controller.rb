class ShippingAddressesController < ApplicationController
  def index
  end

  def new
    @shipping_address = current_user.shipping_addresses.first
  end

  def create
    
  end

  def update
    @shipping_address = current_user.shipping_addresses.first
    @shipping_address.update(shipping_address_params)
    redirect_to root_path
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
    )
  end
end
