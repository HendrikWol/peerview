# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


puts "Destroying seeds..."
Evaluation.destroy_all
Paper.destroy_all
Assignment.destroy_all
Topic.destroy_all
Student.destroy_all
Classroom.destroy_all
Teacher.destroy_all

puts "Creating new classrooms..."
new_classroom1 = Classroom.new(name: "First Year Finance Master")
new_classroom2 = Classroom.new(name: "Second Year Marketing Bachelor")
new_classroom3 = Classroom.new(name: "Third Year Entrepreneurship Bachelor")
new_classroom1.save
new_classroom2.save
new_classroom3.save

puts "Creating new students..."
new_student1 = Student.new(first_name: "Luke", last_name: "Petrovic", email: "luke@hotmail.com", password: "luke@hotmail.com", date_of_birth: Date.strptime("09/14/2000", "%m/%d/%Y"), description: "Currently a student at Le Wagon", city: "Paris", classroom: new_classroom1)
new_student1.save!
new_student2 = Student.new(first_name: "Peter", last_name: "Crouch", email: "peter@hotmail.com", password: "peter@hotmail.com", date_of_birth: Date.strptime("10/11/1997", "%m/%d/%Y"), description: "In between jobs and studying", city: "Barcelona", classroom: new_classroom1)
new_student2.save!
new_student3 = Student.new(first_name: "Anna", last_name: "Lea", email: "anna@hotmail.com", password: "anna@hotmail.com", date_of_birth: Date.strptime("01/21/1999", "%m/%d/%Y"), description: "Want to become a football player", city: "Amsterdam", classroom: new_classroom1)
new_student3.save!
new_student4 = Student.new(first_name: "Darth", last_name: "Vader", email: "darth@hotmail.com", password: "darth@hotmail.com", date_of_birth: Date.strptime("03/01/1977", "%m/%d/%Y"), description: "Lord sith who wants to conquer the world", city: "Paris", classroom: new_classroom1)
new_student4.save!
new_student5 = Student.new(first_name: "Hans", last_name: "Solo", email: "solo@hotmail.com", password: "solo@hotmail.com", date_of_birth: Date.strptime("06/18/1998", "%m/%d/%Y"), description: "Best pilot in the galaxy", city: "London", classroom: new_classroom2)
new_student5.save!
new_student6 = Student.new(first_name: "Lea", last_name: "Skywalker", email: "lea@hotmail.com", password: "lea@hotmail.com", date_of_birth: Date.strptime("07/30/1982", "%m/%d/%Y"), description: "Princess and leader of resistance", city: "Los Angeles", classroom: new_classroom2)
new_student6.save!
new_student7 = Student.new(first_name: "Noel", last_name: "Gallagher", email: "oasis1@hotmail.com", password: "oasis1@hotmail.com", date_of_birth: Date.strptime("02/13/1972", "%m/%d/%Y"), description: "I am the best singer in the world despite of what Liam says", city: "Manchester", classroom: new_classroom3)
new_student7.save!
new_student8 = Student.new(first_name: "Liam", last_name: "Gallagher", email: "liam@hotmail.com", password: "liam@hotmail.com", date_of_birth: Date.strptime("03/03/1967", "%m/%d/%Y"), description: "Definitely better singer than my brother", city: "Machester", classroom: new_classroom3)
new_student8.save!
new_student9 = Student.new(first_name: "Mick", last_name: "Jagger", email: "mick@hotmail.com", password: "mick@hotmail.com", date_of_birth: Date.strptime("12/11/1940", "%m/%d/%Y"), description: "It's time for rock and roll, babe!", city: "Liverpool", classroom: new_classroom3)
new_student9.save!

puts "Creating new teachers..."
new_teacher1 = Teacher.new(first_name: "Paul", last_name: "Wolleswinkel", email: "paul@hotmail.com", password: "paul@hotmail.com", description: "Teaching in Ruby on Rails and former student at Le Wagon", city: "Berlin")
new_teacher1.save!
new_teacher2 = Teacher.new(first_name: "Youssef", last_name: "Paul", email: "youssef@hotmail.com", password: "youssef@hotmail.com", description: "I am a history teacher since day one", city: "Barcelona")
new_teacher2.save!
new_teacher3 = Teacher.new(first_name: "Juliette", last_name: "Engel", email: "juliette@hotmail.com", password: "juliette@hotmail.com", description: "Teaching physics in Amsterdam University", city: "Amsterdam")
new_teacher3.save!

puts "Creating new programs..."
new_program1 = Program.create!(name: "Entrepreneurship Master")
new_program2 = Program.create!(name: "Marketing Bachelor")
new_program3 = Program.create!(name: "Finance Master")

puts "Creating new topics..."
new_topic1 = Topic.create!(name: "Entrepreneurship ", program: new_program1, teacher: new_teacher1)
new_topic2 = Topic.create!(name: "Marketing & Communications", program: new_program2, teacher: new_teacher2)
new_topic3 = Topic.create!(name: "Finance & Economics", program: new_program3, teacher: new_teacher3)


puts "Status of creating seeds: complete"

