class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.authenticate(params[:email], params[:password])

    unless user.nil?
      
    else
      flash.now[:error] = 'Invalid email or password'
      render :new
    end
  end

  def destroy
  end
end
