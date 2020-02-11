class MypagesController < ApplicationController
  def index
    @trades = Trade.where(user_id: current_user.id).limit(3)
  end

  def selling_item_list
    @items = Item.where(user_id: current_user.id)
  end

  def purchase_list
    @trades = Trade.where(user_id: current_user.id)
  end

  def address
    @address = Address.where(user_id: current_user.id)
  end

  def profile_edit
    @user = User.find(current_user.id)
    if @user.update(profile_params)
      redirect_to mypages_path, notice: 'プロフィールが更新されました'
    else
      redirect_to mypages_path, alert: 'プロフィールの更新に失敗しました'
    end
  end

  def address_edit
    @address = Address.find_by(user_id: current_user.id)
    if @address.update(address_params)
      redirect_to mypages_path, notice: '住所が更新されました'
    else
      redirect_to mypages_path, alert: '住所の更新に失敗しました'
    end
  end

  private
    def profile_params
      params.permit(
        :nickname, :profile
      ).merge(id: current_user.id)
    end

    def address_params
      params.require(:address).permit(
        :postal_code, :prefecture, :city, :address, :building_name
    ).merge(id: current_user.id)
    end
end
