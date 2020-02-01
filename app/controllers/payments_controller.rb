class PaymentsController < ApplicationController
  require 'payjp'
  def new
  end

  def show
  end

  def update
      payment = Payment.where(user_id: current_user.id).first
      Payjp.api_key = "sk_test_a02ac9116c8942dbec68459c"
      customer = Payjp::Customer.retrieve(payment.customer_id)
      card = customer.cards.retrieve(payment.card_id)
      card.delete

    @payment = Payment.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
    @payment.save
  end
end
