class MypagesController < ApplicationController
  before_action :authenticate_user!

  def index
    @trades = current_user.trades.limit(3)
  end

  def selling_item_list
    @items = current_user.items
  end

  def purchase_list
    @trades = current_user.trades
  end

  def profile
  end

  def profile_edit
    if current_user.update(user_params)
      redirect_to mypages_path, notice: 'プロフィールが更新されました'
    else
      redirect_to mypages_path, alert: 'プロフィールの更新に失敗しました'
    end
  end

  def login_info
  end

  def login_info_edit
    if current_user.valid_password?(params[:user][:now_password])
      if current_user.update(email: user_params[:email], password: user_params[:password])
      sign_in User.find(current_user.id) unless user_signed_in?
      redirect_to mypages_path, notice: 'メール・パスワードが更新されました'
      else
      flash[:alert] = 'メール・パスワードの更新に失敗しました'
      render :login_info
      return
      end
    else
      flash[:alert] = '現在のパスワードが違います'
      render :login_info
    end
  end

  def address
    @address = current_user.addresses.first
  end

  def address_edit
    @address = current_user.addresses.first
    if @address.update(address_params)
      redirect_to mypages_path, notice: '住所が更新されました'
    else
      flash[:alert] = '住所の更新に失敗しました'
      render :address
    end
  end

  def telephone
  end

  def telephone_edit
    if current_user.update(mobile: user_params[:mobile])
      redirect_to mypages_path, notice: '電話番号が更新されました'
    else
      flash[:alert] = '電話番号の更新に失敗しました'
      render :telephone
    end
  end

  private
    def user_params
      params.require(:user).permit(
        :email, :now_password, :password, :password_confirmation, :nickname, :profile, :mobile
      ).merge(id: current_user.id)
    end

    def address_params
      params.require(:address).permit(
        :postal_code, :prefecture, :city, :address, :building_name
    ).merge(id: current_user.id)
    end
end
