class UserCoursesRelationshipsController < ApplicationController

def create 
    @course = params[:user_courses_relationship][:course_id]
    course_relation = UserCoursesRelationship.where(:course_id => @course)

    unless course_relation.exists?
      current_user.shop!(@course)
      flash[:success] = "Course is added to your shopping cart."
    else
      if course_relation[0].shop == true
        flash[:error] = "This course is already in your shopping cart."
      elsif course_relation[0].take == true
        flash[:error] = "You have already taken this course."
      end
    end
    respond_to do |format|
        format.html { redirect_to users_path}
        format.js
    end
  end

  def destroy
    @relationship = UserCoursesRelationship.where("course_id = ?", params[:course_id])[0]
    @relationship.destroy

    respond_to do |format|
      format.html { redirect_to users_path }
      format.js  
    end
  end
  
  def update_multiple
    if params.has_key?(:course_ids)
      @courses = Course.find(params[:course_ids])
      @courses.each do |course|
        if params[:delete_button]
          UserCoursesRelationship.where("course_id = ?", course.id)[0].destroy
          flash[:success] = "Courses succesfully removed from your shopping bag."
        else
          current_user.take!(course)
          flash[:success] = "Courses succesfully taken!"
        end 
      end    
      redirect_to users_path
    else
      flash[:error] = "You need to make a selection before clicking a button"
      redirect_to users_path
    end
  end
end
