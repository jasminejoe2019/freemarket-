class PaymentsController < ApplicationController
  def index
    @payment = current_user.payments
    if @payment.length == 1
      payment = Payment.find_by(user_id: current_user.id)
      Payjp.api_key = Rails.application.credentials.payjp[:secret_key]
      customer = Payjp::Customer.retrieve(payment.customer_id)
      @card_information = customer.cards.retrieve(payment.card_id)
    end
  end

  def create
    Payjp.api_key = Rails.application.credentials.payjp[:secret_key]
      customer = Payjp::Customer.create(
        card: params[:payjpToken]
      )
    @payment = Payment.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
    if @payment.save
      redirect_to mypages_path, notice: 'クレジットカード情報が登録されました'
    else
      redirect_to mypages_path, alert: 'クレジットカード情報の登録に失敗しました'
    end
  end

  def destroy
    @payment = Payment.find_by(user_id: current_user.id)
    Payjp.api_key = Rails.application.credentials.payjp[:secret_key]
    customer = Payjp::Customer.retrieve(@payment.customer_id)
    card = customer.cards.retrieve(@payment.card_id)
    card.delete
    if @payment.destroy
      redirect_to mypages_path, notice: 'クレジットカード情報が削除されました'
    else
      redirect_to mypages_path, alert: 'クレジットカード情報の登録に失敗しました'
    end
  end
end
