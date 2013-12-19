# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


require 'nokogiri'
require 'open-uri'
require 'rubygems'
require 'sqlite3'
courses = Nokogiri::XML(File.open("courses.xml"))
courses.css('course').each do |node|
  children = node.children

  Courses.create(
    acode: node['acode'],
        code: node['code'],
        sgid: node['sgid'],
    name: children.css('name').inner_text,
    ects: children.css('ects').inner_text,
    year: children.css('year').inner_text,
        period: children.css('period').inner_text,
        institute: children.css('institute').inner_text,
        description: children.css('description').inner_text,
        timetable: children.css('timetable').inner_text,
        lecture_material: children.css('lecture_material').inner_text,
        goals: children.css('goals').inner_text,
        participant_count: children.css('participant_count').inner_text,
        specialities: children.css('specialities').inner_text,
        examination: children.css('examination').inner_text
  )
  
end