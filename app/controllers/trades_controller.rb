class TradesController < ApplicationController
  require 'payjp'

  def index
    @item = Item.find(1)
    
    payment = Payment.where(user_id: current_user.id).first
      Payjp.api_key = "sk_test_a02ac9116c8942dbec68459c"
      customer = Payjp::Customer.retrieve(payment.customer_id)
      @card_information = customer.cards.retrieve(payment.card_id)
  end
end
