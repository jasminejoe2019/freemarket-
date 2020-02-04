class TradesController < ApplicationController
  def index
    @item = Item.first  
    @payment = current_user.payments

    payment = Payment.find_by(user_id: current_user.id)
      Payjp.api_key = Rails.application.credentials.payjp[:secret_key]
      customer = Payjp::Customer.retrieve(payment.customer_id)
      @card_information = customer.cards.retrieve(payment.card_id)
  end

  def create
    @item = Item.first
    @user = current_user
    @trade = Trade.new(
        user_id: current_user.id,
        item_id: @item.id
      )
      if @trade.save && @item.status_id == 1
      # status_idをチェックし販売中の品物であるか確認。販売中だった場合は売買済みに更新。
        ActiveRecord::Base.transaction do
          @item.update!(status_id: 2)
          @user.update!(sales: @user.sales + @item.price)
        end
      elsif @item.status_id != 1
        flash[:alert] = '申し訳ございません。商品は売買済み・または出品停止中です'
        redirect_to root_path
      else 
        flash[:alert] = '申し訳ございません。商品購入時にエラーが発生しました'
        redirect_to root_path
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
  def trade_params
    params.require(:trade).permit(
      :user_id,
      :item_id,
    )
  end
end
