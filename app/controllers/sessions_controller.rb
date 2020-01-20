class SessionsController < ApplicationController
  def index
    
  end
  def destroy
    reset_session
    redirect_to root_path
  end
end
