class Course < ActiveRecord::Base
has_many :user_courses_relationships
has_many :users, :through => :user_courses_relationships
 
   def self.search(search)
    find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
	else
		find(:all)
 
  end
end