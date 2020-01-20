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
      session[:birthday] = user_params["birthday(1i)"]+"/"+user_params["birthday(2i)"]+"/"+user_params["birthday(3i)"]
      session[:name] = user_params[:family_name]+user_params[:first_name]
      session[:furigana] = user_params[:family_furigana]+user_params[:first_furigana]
      @user = User.new
    end

    def create4
      session[:telephone] = user_params[:telephone]
      @user = User.new
      @user.addresses.build
    end

    def create5
      binding.pry
      session[:postal_code] = user_params["addresses_attributes"]["0"]["postal_code"]
      session[:prefecture] = user_params["addresses_attributes"]["0"]["prefecture"]
      session[:city] = user_params["addresses_attributes"]["0"]["city"]
      session[:address] = user_params["addresses_attributes"]["0"]["address"]
      session[:building_name] = user_params["addresses_attributes"]["0"]["building_name"]
      @user = User.new
      @user.payments.build
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
      telephone: session[:telephone]
      )
      @address = Address.new(
      postal_code: session[:postal_code],
      prefecture: session[:prefecture],
      city: session[:city],
      address: session[:address],
      building_name: session[:building_name]
      )
      if @user.save
        session[:id] = @user.id
        redirect_to "/signup/create6"
      else
        render '/signup/create1'
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
        :telephone,
        addresses_attributes: [:id, :postal_code, :prefecture, :city, :address, :building_name],
        payments_attributes: [:id, :customer, :card]
    )
    end
end