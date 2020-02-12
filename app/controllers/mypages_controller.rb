class MypagesController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = User.find(current_user.id)
    @trades = Trade.where(user_id: current_user.id).limit(3)
  end

  def selling_item_list
    @items = Item.where(user_id: current_user.id)
  end

  def purchase_list
    @trades = Trade.where(user_id: current_user.id)
  end

  def profile
    @user = User.find(current_user.id)
  end

  def profile_edit
    @user = User.find(current_user.id)
    if @user.update(user_params)
      redirect_to mypages_path, notice: 'プロフィールが更新されました'
    else
      redirect_to mypages_path, alert: 'プロフィールの更新に失敗しました'
    end
  end

  def login_info
    @user = User.find(current_user.id)
  end

  def login_info_edit
    binding.pry
    @user = User.find(current_user.id)
    ActiveRecord::Base.transaction do
      if @user.update(email: user_params[:email], password: user_params[:password])
        sign_in User.find(current_user.id) unless user_signed_in?
        redirect_to mypages_path, notice: 'メール・パスワードが更新されました'
      else
        flash[:alert] = 'メール・パスワードの更新に失敗しました'
        render :login_info
      end
    end
  end

  def address
    @address = Address.find_by(user_id: current_user.id)
  end

  def address_edit
    @address = Address.find_by(user_id: current_user.id)
    if @address.update(address_params)
      redirect_to mypages_path, notice: '住所が更新されました'
    else
      flash[:alert] = '住所の更新に失敗しました'
      render :address
    end
  end

  def telephone
    @user = User.find(current_user.id)
  end

  def telephone_edit
    @user = User.find(current_user.id)
    if @user.update(mobile: user_params[:mobile])
      redirect_to mypages_path, notice: '電話番号が更新されました'
    else
      flash[:alert] = '電話番号の更新に失敗しました'
      render :telephone
    end
  end

  private
    def user_params
      params.require(:user).permit(
        :email, :password, :nickname, :profile, :mobile
      ).merge(id: current_user.id)
    end

    def address_params
      params.require(:address).permit(
        :postal_code, :prefecture, :city, :address, :building_name
    ).merge(id: current_user.id)
    end
end
