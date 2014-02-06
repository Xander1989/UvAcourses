class CreateUserCoursesRelationships < ActiveRecord::Migration
  def change
    create_table :user_courses_relationships do |t|
      t.integer :user_id
      t.integer :course_id
      t.boolean :shop
      t.boolean :take

      t.timestamps
    end
  end
end
