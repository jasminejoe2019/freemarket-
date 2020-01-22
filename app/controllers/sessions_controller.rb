class SessionsController < ApplicationController
  def index
    
  end
  def create
    user=User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      session[:user_id]=user.id
      redirect_to root_path
    else
      render :new
    end
  end
  def destroy
    reset_session
    redirect_to root_path
  end
end
