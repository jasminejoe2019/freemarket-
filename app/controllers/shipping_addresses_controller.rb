class ShippingAddressesController < ApplicationController
  def index
    @shipping_address = current_user.shipping_addresses.first
  end

  def new
    @shipping_address = current_user.shipping_addresses.first
  end

  def create
    @shipping_address = ShippingAddress.new(
      first_name: params[:family_name],
      first_furigana: params[:first_furigana],
      family_name: params[:family_name],
      family_furigana: params[:family_furigana],
      postal_code: params[:postal_code],
      prefecture: params[:prefecture],
      city: params[:city],
      address: params[:address],
      building_name: params[:building_name],
      telephone: params[:telephone],
      user_id: current_user.id
    )
    if @shipping_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  def update
    @shipping_address = current_user.shipping_addresses.first
    if @shipping_address.update(shipping_address_params)
      redirect_to root_path
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
      :telephone,
      :user_id
    )
  end
end
