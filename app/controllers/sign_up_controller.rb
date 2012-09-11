class SignUpController < ApplicationController

  def index
    @company = Company.new
  end

  def create
     @company = Company.new(name: params[:company_name])

     @company.user = 

    if @company.valid? 
      @company.save
    else
      render :index
    end
  end
end
