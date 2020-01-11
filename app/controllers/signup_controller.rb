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
      session[:nickname] = user_params[:nickname]
      @address = Address.new
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
    )
    end

    def address_params
      params.require(:address).permit(
      )
    end
end