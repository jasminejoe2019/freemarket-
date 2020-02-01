class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # before_action :authenticate_user!, except: :index
  # before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :basic_auth



  private

  def production?
    Rails.env.production?
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username,password|
      username == Rails.application.credentials.basic_auth[:user] && password == Rails.application.credentials.basic_auth[:pass]
    end
  end
  def after_sign_in_path_for(resource)
      root_path
  end
end
