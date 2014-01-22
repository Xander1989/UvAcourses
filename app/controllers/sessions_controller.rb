class SessionsController < ApplicationController

	def new
	end

def create
    user = User.find_by(studienummer: params[:session][:studienummer].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_to user
    else
      flash.now[:error] = 'Invalid studienummer/password combination'
      render 'new'
    end
  end

	def destroy
    	sign_out
    	redirect_to root_url
  	end

end