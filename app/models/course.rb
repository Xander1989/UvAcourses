class Course < ActiveRecord::Base
 
   def self.search(search)
    find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
	else
		find(:all)
 
  end
end