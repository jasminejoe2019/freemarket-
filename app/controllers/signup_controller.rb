class SignupController < ApplicationController
    def create2
      @user = User.new
    end

    def create3
      session[:nickname] = user_params[:nickname]
      session[:email] = user_params[:email]
      session[:password] = user_params[:password]
      session[:family_name] = user_params[:family_name]
      session[:first_name] = user_params[:first_name]
      session[:family_furigana] = user_params[:family_furigana]
      session[:first_furigana] = user_params[:first_furigana]
      session[:birthday] = user_params[:birthday]
      @user = User.new
    end

    def create4
      session[:telephone] = user_params[:telephone]
      @user = User.new
      @user.addresses.build
    end

    def create5
      session[:postal_code] = user_params[:postal_code]
      session[:prefecture] = user_params[:prefecture]
      session[:city] = user_params[:city]
      session[:address] = user_params[:address]
      session[:building_name] = user_params[:building_name]
      @user = User.new
      @user.payments.build
    end

    def create6
      session[:user_id] = user_params[:user_id]
      session[:customer_id] = user_params[:customer_id]
      session[:card_id] = user_params[:card_id]
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
      )
      @user.build_addresses(user_params[:addresses_attributes])
      if @user.save
        session[:id] = @user.id
        redirect_to root_path
      else
        render '/signup/registration'
      end
    end

    def done
      sign_in User.find(session[:id]) unless user_signed_in?
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
        :telephone,
        addresses_attributes: [:id, :postal_code, :prefecture, :city, :address, :building_name],  
        payments_attributes: [:id, :customer, :card]
    )
    end
end