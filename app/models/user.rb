class User < ActiveRecord::Base

  has_many :user_courses_relationships
  has_many :courses, :through => :user_courses_relationships 

  before_save { self.email = email.downcase }
  before_create :create_remember_token

  validates :studienummer,  presence: true, length: {is: 8}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  has_secure_password
  validates :password, length: { minimum: 8 }
	

  def shop!(courseid)
    user_courses_relationships.create!( :course_id => courseid, :shop => true )
  end

  def take!(course)
    found = user_courses_relationships.where("course_id = ?", course.id )
    found[0].shop = false
    found[0].take = true
    found[0].save
  end
 

 def self.search(search)
  like_keyword = "%#{search}%"
 return Course.where("name LIKE ?", like_keyword)
 end

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private

    def create_remember_token
      self.remember_token = User.encrypt(User.new_remember_token)
    end

end