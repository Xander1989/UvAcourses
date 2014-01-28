class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :acode
      t.string :code
      t.string :sgid
      t.string :name
      t.string :staff_name
      t.integer :ects
      t.integer :year
      t.string :period
      t.string :institute
      t.text :description
      t.text :timetable
      t.text :lecture_material
      t.text :goals
      t.text :participant_count
      t.text :specialities
      t.text :examination

      t.timestamps
    end
  end
end