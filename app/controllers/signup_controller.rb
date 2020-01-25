class SignupController < ApplicationController
  before_action :validates_create2, only: :create3
  before_action :validates_create3, only: :create4

    def create2
      @user = User.new
    end

    def create3
      session[:name] = user_params[:family_name]+user_params[:first_name]
      session[:furigana] = user_params[:family_furigana]+user_params[:first_furigana]
      @user = User.new
    end

    def validates_create2
      session[:nickname] = user_params[:nickname]
      session[:email] = user_params[:email]
      session[:password] = user_params[:password]
      session[:family_name] = user_params[:family_name]
      session[:first_name] = user_params[:first_name]
      session[:family_furigana] = user_params[:family_furigana]
      session[:first_furigana] = user_params[:first_furigana]
      session[:birthday] = user_params["birthday(1i)"]+"/"+user_params["birthday(2i)"]+"/"+user_params["birthday(3i)"]
      session[:name] = user_params[:family_name]+user_params[:first_name]
      session[:furigana] = user_params[:family_furigana]+user_params[:first_furigana]
      @user = User.new(
      nickname: session[:nickname],
      email: session[:email],
      password: session[:password],
      family_name: session[:family_name],
      first_name: session[:first_name],
      family_furigana: session[:family_furigana],
      first_furigana: session[:first_furigana],
      birthday: session[:birthday],
      mobile: "09011112222"
      )
      render '/signup/create2' unless @user.valid?
    end
    

    def create4
      @user = User.new
      @user.addresses.build
    end

    def validates_create3
      session[:mobile] = user_params[:mobile]
      @user = User.new(
      nickname: session[:nickname],
      email: session[:email],
      password: session[:password],
      family_name: session[:family_name],
      first_name: session[:first_name],
      family_furigana: session[:family_furigana],
      first_furigana: session[:first_furigana],
      birthday: session[:birthday],
      mobile: session[:mobile]
      )
      render '/signup/create3' unless @user.valid?
    end

    def create5
      session[:postal_code] = params[:user][:addresses][:postal_code]
      session[:prefecture] = params[:user][:addresses][:prefecture]
      session[:city] = params[:user][:addresses][:city]
      session[:address] = params[:user][:addresses][:address]
      session[:building_name] = params[:user][:addresses][:building_name]
      @user = User.new
      @user.payments.build
    end

    def create6
      sign_in User.find(session[:id]) unless user_signed_in?
      redirect_to root_path
    end

    def create
      @user = User.new(
      nickname: session[:nickname],
      email: session[:email],
      password: session[:password],
      family_name: session[:family_name],
      first_name: session[:first_name],
      family_furigana: session[:family_furigana],
      first_furigana: session[:first_furigana],
      birthday: session[:birthday],
      mobile: session[:mobile]
      )
      @user.addresses.build(
        postal_code: session[:postal_code],
        prefecture: session[:prefecture],
        city: session[:city],
        address: session[:address],
        building_name: session[:building_name]
      )
      if @user.save
        session[:id] = @user.id
        Payjp.api_key = 'sk_test_a02ac9116c8942dbec68459c'
        customer = Payjp::Customer.create(
          card: params[:payjpToken]
        )
        @payment = Payment.new(user_id: session[:id], customer_id: customer.id, card_id: customer.default_card)
        if @payment.save
        redirect_to "/signup/create6"
        else
        render '/signup/create5'
        end
      else
        render '/signup/create2'
      end
    end

    private
    def user_params
      params.require(:user).permit(
        :nickname,
        :email,
        :password,
        :family_name,
        :first_name,
        :family_furigana,
        :first_furigana,
        :birthday,
        :mobile,
        addresses_attributes: [:id, :postal_code, :prefecture, :city, :address, :building_name]
    )
    end
end