class TradesController < ApplicationController
  def index
    @item = Item.first  
    @payment = current_user.payments

    payment = Payment.where(user_id: current_user.id).first
      Payjp.api_key = Rails.application.credentials.payjp[:secret_key]
      customer = Payjp::Customer.retrieve(payment.customer_id)
      @card_information = customer.cards.retrieve(payment.card_id)
  end

  def new
    @item = Item.first  
    
    payment = Payment.where(user_id: current_user.id).first
      Payjp.api_key = Rails.application.credentials.payjp[:secret_key]
      customer = Payjp::Customer.retrieve(payment.customer_id)
      @card_information = customer.cards.retrieve(payment.card_id)

      Payjp::Charge.create(
        :amount => @item.price,
        :customer => payment.customer_id,
        :currency => 'jpy',
      )

      @trade = Trade.new(
        user_id: current_user.id,
        item_id: @item.id
      )
      @trade.save
  end

  private
  def trade_params
    params.require(:trade).permit(
      :user_id,
      :item_id,
    )
  end
end
