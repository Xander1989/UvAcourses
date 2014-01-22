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
  	@courses = Course.all
  end

  

end
