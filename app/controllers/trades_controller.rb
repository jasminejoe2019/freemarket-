class TradesController < ApplicationController
  require 'payjp'

  def index
    @item = Item.find(1)
    
    payment = Payment.where(user_id: current_user.id).first
      Payjp.api_key = "sk_test_a02ac9116c8942dbec68459c"
      customer = Payjp::Customer.retrieve(payment.customer_id)
      @card_information = customer.cards.retrieve(payment.card_id)
  end

  def new
    @item = Item.find(1)
    
    payment = Payment.where(user_id: current_user.id).first
      Payjp.api_key = "sk_test_a02ac9116c8942dbec68459c"
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
