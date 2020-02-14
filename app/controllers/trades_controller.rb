class TradesController < ApplicationController
  before_action :authenticate_user!

  def new
    @item = Item.find(params[:item_id])
    @payment = current_user.payments.first
    if @payment.present?
      payment = Payment.find_by(user_id: current_user.id)
      Payjp.api_key = Rails.application.credentials.payjp[:secret_key]
      customer = Payjp::Customer.retrieve(payment.customer_id)
      @card_information = customer.cards.retrieve(payment.card_id)
    end
  end

  def create
    @item = Item.find(params[:item_id])
    @user = @item.user
    @trade = Trade.new(
        user_id: current_user.id,
        item_id: @item.id
      )
      ActiveRecord::Base.transaction do
        if @trade.save! && @item.status_id == 1
        # status_idをチェックし販売中の品物であるか確認。販売中だった場合は売買済みに更新。
          @item.update!(status_id: 2)
          @user.update!(sales: @user.sales + @item.price)
        elsif @item.status_id != 1
        flash[:alert] = '申し訳ございません。商品は売買済み・または出品停止中です'
        redirect_to root_path
        else 
        flash[:alert] = '申し訳ございません。商品購入時にエラーが発生しました'
        redirect_to root_path
        end
      end

    payment = Payment.find_by(user_id: current_user.id)
      Payjp.api_key = Rails.application.credentials.payjp[:secret_key]
      customer = Payjp::Customer.retrieve(payment.customer_id)
      @card_information = customer.cards.retrieve(payment.card_id)

      Payjp::Charge.create(
        amount: @item.price,
        customer: payment.customer_id,
        currency: 'jpy'
      )
  end

  private
  def set_item(item_id)
    @item = Item.find(params[:item_id])
  end

  def trade_params
    params.require(:trade).permit(
      :user_id,
      :item_id,
    )
  end
end
