class StaticPagesController < ApplicationController
  def home
  end

  def help
  end

  def contact
  end

  def about
  end

  def list
  	@courses = Course.all.paginate(page: params[:page], :per_page => 10) 
    @staffs = Staff.all.paginate(page: params[:page], :per_page => 10) 
  end

  

end
