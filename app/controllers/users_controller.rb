class UsersController < ApplicationController

   def index
   end

   def new
    @user = User.new
     
   end

   def show
    @courses = Course.all    
    @courses = Course.search(params[:search])

   
   end

 def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to UvAcourses!"
      redirect_to @user
    else
      render 'new'
    end
  end

  private

    def user_params
      params.require(:user).permit(:studienummer, :email, :password,
                                   :password_confirmation)
    end
end
