# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Student.destroy_all
Classroom.destroy_all
Teacher.destroy_all
new_classroom1 = Classroom.new(name: "First Year Finance Master")
new_classroom2 = Classroom.new(name: "Second Year Finance Bachelor")
new_classroom3 = Classroom.new(name: "First Year Finance Bachelor")
new_classroom1.save
new_classroom2.save
new_classroom3.save
new_student1 = Student.new(first_name: "Luke", last_name: "Petrovic", email: "luke@hotmail.com", password: "luke@hotmail.com", date_of_birth: Date.today, description: "Currently a student at Le Wagon", city: "Paris", classroom_id: new_classroom1.id)
new_student1.save
new_student2 = Student.new(first_name: "Peter", last_name: "Crouch", email: "peter@hotmail.com", password: "peter@hotmail.com", date_of_birth: Date.today, description: "In between jobs and studying", city: "Barcelona", classroom_id: new_classroom2.id)
new_student2.save
new_student3 = Student.new(first_name: "Anna", last_name: "Lea", email: "anna@hotmail.com", password: "anna@hotmail.com", date_of_birth: Date.today, description: "Want to become a football player", city: "Amsterdam", classroom_id: new_classroom3.id)
new_student3.save

new_teacher1 = Teacher.new(first_name: "Paul", last_name: "Wolleswinkel", email: "paul@hotmail.com", password: "paul@hotmail.com", description: "Teaching in Ruby on Rails and former student at Le Wagon", city: "Berlin")
new_teacher1.save
new_teacher2 = Teacher.new(first_name: "Youssef", last_name: "Paul", email: "youssef@hotmail.com", password: "youssef@hotmail.com", description: "I am a history teacher since day one", city: "Barcelona")
new_teacher2.save
new_teacher3 = Teacher.new(first_name: "Juliette", last_name: "Engel", email: "juliette@hotmail.com", password: "juliette@hotmail.com", description: "Teaching physics in Amsterdam University", city: "Amsterdam")
new_teacher3.save

new_program1 = Program.create(name: "Entrepreneurship Master")
new_program2 = Program.create(name: "Management Master")
new_program3 = Program.create(name: "Finance Master")

new_topic1 = Topic.create(name: "Entrepreneurship ", program_id: new_program1.id, teacher_id: new_teacher1.id)
new_topic2 = Topic.create(name: "Management & Business", program_id: new_program2.id, teacher_id: new_teacher1.id)
new_topic3 = Topic.create(name: "Finance & Economics", program_id: new_program3.id, teacher_id: new_teacher1.id)
