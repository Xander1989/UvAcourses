class UserCoursesRelationship < ActiveRecord::Base
  belongs_to :user
  belongs_to :course
  validates :user_id, presence: true
  validates :course_id, presence: true
  before_save :set_default_relations

  def set_default_relations
    self.shop ||= false
    self.take ||= false
    nil
  end
end