class SignUpController < ApplicationController

  def new
    @company = Company.new

    user = @company.users.build
  end

  def create
     @company = Company.new(params[:company])

    if @company.save
      redirect_to dashboard_url
    else
      render :new 
    end
  end
end
