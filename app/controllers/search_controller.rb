class SearchController < UsersController

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
  @result = @result.paginate(page: params[:page], :per_page => 10)
end


end