class UsersController < ApplicationController
  

  def new
    @user = User.new     
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

    def show
    @courses = Course.all.paginate(page: params[:page], :per_page => 10)
    end

      def mycourses
     @shopcourses = Course.joins(:user_courses_relationships).where("shop = ?", true).paginate(:per_page => 10, :page => params[:page])
     @takecourses = Course.joins(:user_courses_relationships).where("take = ?", true).paginate(:per_page => 10, :page => params[:page])
     @shop = @shopcourses.where("user_id = ?", current_user.id )
     @take = @takecourses.where("user_id = ?", current_user.id)
   end
      
    def set_cookie
    unless cookies[:view] == nil
      recentid = cookies[:view] + params[:id][1..-1]
    else
      recentid = params[:id][1..-1]   
    end

      # save viewed course id's in cookie
      cookies[:view] = { :value => recentid, :expires => 2.hours.from_now }
      redirect_to root_path
    end

    def recently_viewed
       # if there exists a recently viewed cookie in the database
    unless cookies[:view] == nil
      @ids = cookies[:view].split(/#/)[1..-1]

      # recently viewed courses should be showed in reversed order and only once
      @ids = @ids.reverse.uniq
      @courses = Array.new
      
      # find courses by course id's 
      @ids.each do |id|
        @courses.append(Course.where("id = ?", id)[0])
      end
      @courses = @courses.take(20)
    else
      @courses = []
    end
  end
 end

   def shop
    @courses = Course.joins(:user_courses_relationships).where("shop = ?", true).paginate(:per_page => 10, :page => params[:page])
   end

 

   

  

   

  private

    def user_params
      params.require(:user).permit(:studienummer, :email, :password,
                                   :password_confirmation)
    end

