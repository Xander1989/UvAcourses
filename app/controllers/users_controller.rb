class UsersController < ApplicationController

   def index 
    courses =  Course.all
     @result = Array.new
     courses.each do |course|
      if course.name.include? params[:search]
        @result.push(course)
      end
     end
   end

   def new
    @user = User.new
     
   end

   def show
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
