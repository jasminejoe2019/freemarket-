class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    callback_for(:facebook)
  end
  def google_oauth2
    callback_for(:google)
  end

  def callback_for(provider)
    @omniauth=request.env['omniauth.auth']
    info=User.find_oauth(@omniauth)
    @user=info[:user]
    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication
    else
      # session["devise.#{provider}_data"]=request.env["omniauth.auth"]
      password = Devise.friendly_token.first(7)
      if session[:provider].present? && session[:uid].present?
        @newuser = User.create(nickname: @user.nickname, email: @user.email, password: password, first_furigana: session[:first_furigana],family_furigana: session[:family_furigana], first_name: session[:first_name], family_name: session[:family_name])
      else
        # binding.pry
        @newuser = User.create(nickname: @user.nickname, email: @user.email, password: password)
        sns = SnsCredential.create(user_id: @newuser.id,uid: info[:sns][:uid], provider: info[:sns][:provider])
      end
      sign_in_and_redirect @newuser, event: :authentication
    end
  end

  def failure
    redirect_to root_path and return
  end

end