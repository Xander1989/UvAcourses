class UsersController < ApplicationController

   def index 

    courses =  Course.all
     @result = Array.new

if params[:type] == 'course'
     courses.each do |course|
      if course.name.include? params[:search]
        @result.push(course)
      end
    end

elsif params[:type] == 'descriptions'
      courses.each do |course|
      if course.description.include? params[:search]
        @result.push(course)
      end
    end

elsif params[:type] == 'sgid'
      courses.each do |course|
      if course.sgid.include? params[:search]
        @result.push(course)
      end
    end

elsif params[:type] == 'staff'
      courses.each do |course|
      if course.staff_name.include? params[:search]
        @result.push(course)
      end
    end
  end
end

   

   def new
    @user = User.new
     
   end

   def show
    @courses = Course.all.paginate(page: params[:page], :per_page => 10) 
    @staffs = Staff.all.paginate(page: params[:page], :per_page => 10) 
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
