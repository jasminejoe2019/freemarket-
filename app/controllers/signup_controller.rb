class SignupController < ApplicationController
  before_action :entry, only: :user_create_profile
  before_action :redirect, except: :user_create
  before_action :user_profile_validates, only: :user_create_telephone
  before_action :user_telephone_validates, only: :user_create_address

    def entry
      session[:token] = "true"
    end

    def user_create_profile
      session[:token] = "true"
      @user = User.new
    end

    def user_create_telephone
      session[:name] = user_params[:family_name]+user_params[:first_name]
      session[:furigana] = user_params[:family_furigana]+user_params[:first_furigana]
      session[:token] = "true"
      @user = User.new
    end

    def user_profile_validates
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
      render '/signup/user_create_profile' unless @user.valid?
      session[:token] = "true"
    end
    

    def user_create_address
      session[:token] = "true"
      @user = User.new
      @user.addresses.build
    end

    def user_telephone_validates
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
      render '/signup/user_create_telephone' unless @user.valid?
    end

    def user_create_payment
      session[:postal_code] = params[:user][:addresses][:postal_code]
      session[:prefecture] = params[:user][:addresses][:prefecture]
      session[:city] = params[:user][:addresses][:city]
      session[:address] = params[:user][:addresses][:address]
      session[:building_name] = params[:user][:addresses][:building_name]
      session[:token] = "true"
      @user = User.new
      @user.payments.build
    end

    def user_create_finish
      session[:token] = "true"
      sign_in User.find(session[:id]) unless user_signed_in?
    end

    def create
      session[:token] = "true"
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
        Payjp.api_key = "sk_test_a02ac9116c8942dbec68459c"
        customer = Payjp::Customer.create(
          card: params[:payjpToken]
        )
        @payment = Payment.new(user_id: session[:id], customer_id: customer.id, card_id: customer.default_card)
        if @payment.save
        redirect_to "/signup/user_create_finish"
        else
        render '/signup/user_create_payment'
        end
      else
        render '/signup/user_create_profile'
      end
    end

    private
    def redirect
      redirect_to create1_signup_index_path unless session[:token] == "true"
      session[:token] = "false"
    end

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