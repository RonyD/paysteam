class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.authenticate(params[:email], params[:password])

    unless user.nil?
      session[:user_id] = user.id
      redirect_to dashboard_url
    else
      flash.now[:error] = 'Invalid email or password'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path
  end
end
