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
new_student4 = Student.new(first_name: "Darth", last_name: "Vader", email: "darth@hotmail.com", password: "darth@hotmail.com", date_of_birth: Date.strptime("03/01/1977", "%m/%d/%Y"), description: "Lord sith who wants to conquer the world", city: "Paris", classroom: new_classroom2)
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

puts "Creating new assignments..."
new_assignment1 = Assignment.create!(name: "Assignment 1", deadline: Date.today, description: "Report about entrepreneurship", classroom: new_classroom1, teacher: new_teacher1, topic: new_topic1)
new_assignment2 = Assignment.create!(name: "Assignment 2", deadline: Date.strptime("09/24/2017", "%m/%d/%Y"), description: "Report about the entrepreneurship of Adam Smith", classroom: new_classroom1, teacher: new_teacher1, topic: new_topic1)
new_assignment3 = Assignment.create!(name: "Assignment 3", deadline: Date.strptime("09/22/2017", "%m/%d/%Y"), description: "Report about the marketing", classroom: new_classroom2, teacher: new_teacher2, topic: new_topic2)
new_assignment4 = Assignment.create!(name: "Assignment 4", deadline: Date.strptime("09/23/2017", "%m/%d/%Y"), description: "Report about the marketing of Steve Jobs", classroom: new_classroom2, teacher: new_teacher2, topic: new_topic2)
new_assignment5 = Assignment.create!(name: "Assignment 5", deadline: Date.strptime("09/19/2017", "%m/%d/%Y"), description: "Report about the finance", classroom: new_classroom3, teacher: new_teacher3, topic: new_topic3)
new_assignment6 = Assignment.create!(name: "Assignment 6", deadline: Date.strptime("09/25/2017", "%m/%d/%Y"), description: "Report about finance of Bill Gates", classroom: new_classroom3, teacher: new_teacher3, topic: new_topic3)

puts "Creating new papers"
new_paper1 = Paper.create!(title: "Luke report", assignment: new_assignment1, student: new_student1, attachment: "http://res.cloudinary.com/dq8w9lavg/raw/upload/v1506338768/yxvwswgyhdtanml4fckt.docx" )
new_paper2 = Paper.create!(title: "Luke report 2", assignment: new_assignment2, student: new_student1, attachment: "http://res.cloudinary.com/dq8w9lavg/raw/upload/v1506338849/bpeinqi2ggdjtkvgya79.docx" )
new_paper3 = Paper.create!(title: "Peter report", assignment: new_assignment1, student: new_student2, attachment: "http://res.cloudinary.com/dq8w9lavg/raw/upload/v1506416178/Peter_report_ybreuu.docx" )
new_paper4 = Paper.create!(title: "Peter report 2", assignment: new_assignment2, student: new_student2, attachment: "http://res.cloudinary.com/dq8w9lavg/raw/upload/v1506416836/Peter_2_report_iymwpr.docx" )
new_paper5 = Paper.create!(title: "Anna report", assignment: new_assignment1, student: new_student3, attachment: "http://res.cloudinary.com/dq8w9lavg/raw/upload/v1506416924/Anna_report_nlypbz.docx" )
new_paper6 = Paper.create!(title: "Anna report 2", assignment: new_assignment2, student: new_student3, attachment: "http://res.cloudinary.com/dq8w9lavg/raw/upload/v1506416941/Anna_2_report_ngsr3f.docx" )

new_paper7 = Paper.create!(title: "Darth report", assignment: new_assignment3, student: new_student4, attachment: "http://res.cloudinary.com/dq8w9lavg/raw/upload/v1506417110/Darth_report_kpw9wl.docx" )
new_paper8 = Paper.create!(title: "Darth report 2", assignment: new_assignment4, student: new_student4, attachment: "http://res.cloudinary.com/dq8w9lavg/raw/upload/v1506417130/Darth_2_report_qczwh1.docx" )
new_paper9 = Paper.create!(title: "Hans report", assignment: new_assignment3, student: new_student5, attachment: "http://res.cloudinary.com/dq8w9lavg/raw/upload/v1506417298/Hans_report_ie3exd.docx" )
new_paper10 = Paper.create!(title: "Hans report 2", assignment: new_assignment4, student: new_student5, attachment: "http://res.cloudinary.com/dq8w9lavg/raw/upload/v1506417323/Hans_2_report_e7oyyz.docx" )
new_paper11 = Paper.create!(title: "Lea report", assignment: new_assignment3, student: new_student6, attachment: "http://res.cloudinary.com/dq8w9lavg/raw/upload/v1506417175/Lea_report_oiska3.docx" )
new_paper12 = Paper.create!(title: "Lea report 2", assignment: new_assignment4, student: new_student6, attachment: "http://res.cloudinary.com/dq8w9lavg/raw/upload/v1506417211/Lea_2_report_rpfwct.docx"  )

new_paper13 = Paper.create!(title: "Noel report", assignment: new_assignment5, student: new_student7, attachment: "http://res.cloudinary.com/dq8w9lavg/raw/upload/v1506417460/Noel_report_qzqpqv.docx" )
new_paper14 = Paper.create!(title: "Noel report 2", assignment: new_assignment6, student: new_student7, attachment: "http://res.cloudinary.com/dq8w9lavg/raw/upload/v1506417465/Noel_2_report_xxzjzo.docx" )
new_paper15 = Paper.create!(title: "Liam report", assignment: new_assignment5, student: new_student8, attachment: "http://res.cloudinary.com/dq8w9lavg/raw/upload/v1506417474/Liam_report_zhulfu.docx" )
new_paper16 = Paper.create!(title: "Liam report 2", assignment: new_assignment6, student: new_student8, attachment: "http://res.cloudinary.com/dq8w9lavg/raw/upload/v1506417477/Liam_2_report_ilxupw.docx" )
new_paper17 = Paper.create!(title: "Mick report", assignment: new_assignment5, student: new_student9, attachment: "http://res.cloudinary.com/dq8w9lavg/raw/upload/v1506417486/Mick_report_a2bgdj.docx" )
new_paper18 = Paper.create!(title: "Mick report 2", assignment: new_assignment6, student: new_student9, attachment: "https://cloudinary.com/console/media_library#/dialog/raw/upload/Mick_2_report_lshcs5.docx"  )

puts "Creating evaluations..."
new_evaluation1 = Evaluation.create!(readability: 8, referencing: 10, knowledge_of_topic: 7, final_grade: 8, paper: new_paper1, feeback_text: "cool project, good job!" )
new_evaluation2 = Evaluation.create!(readability: 7, referencing: 9, knowledge_of_topic: 8, final_grade: 7, paper: new_paper2, feeback_text: "cool project, good job!" )
new_evaluation3 = Evaluation.create!(readability: 6, referencing: 8, knowledge_of_topic: 7, final_grade: 9, paper: new_paper3, feeback_text: "cool project, good job!" )
new_evaluation4 = Evaluation.create!(readability: 9, referencing: 7, knowledge_of_topic: 6, final_grade: 8, paper: new_paper4, feeback_text: "cool project, good job!" )
new_evaluation5 = Evaluation.create!(readability: 8, referencing: 6, knowledge_of_topic: 7, final_grade: 7, paper: new_paper5, feeback_text: "cool project, good job!" )

new_evaluation6 = Evaluation.create!(readability: 7, referencing: 7, knowledge_of_topic: 8, final_grade: 9, paper: new_paper6, feeback_text: "cool project, good job!" )
new_evaluation7 = Evaluation.create!(readability: 10, referencing: 8, knowledge_of_topic: 7, final_grade: 8, paper: new_paper7, feeback_text: "cool project, good job!" )
new_evaluation8 = Evaluation.create!(readability: 5, referencing: 9, knowledge_of_topic: 6, final_grade: 7, paper: new_paper8, feeback_text: "cool project, good job!" )
new_evaluation9 = Evaluation.create!(readability: 7, referencing: 10, knowledge_of_topic: 7, final_grade: 8, paper: new_paper9, feeback_text: "cool project, good job!" )
new_evaluation10 = Evaluation.create!(readability: 9, referencing: 3, knowledge_of_topic: 8, final_grade: 9, paper: new_paper10, feeback_text: "cool project, good job!" )

new_evaluation11 = Evaluation.create!(readability: 10, referencing: 7, knowledge_of_topic: 7, final_grade: 7, paper: new_paper11, feeback_text: "cool project, good job!" )
new_evaluation12 = Evaluation.create!(readability: 8, referencing: 8, knowledge_of_topic: 8, final_grade: 9, paper: new_paper12, feeback_text: "cool project, good job!" )
new_evaluation13 = Evaluation.create!(readability: 9, referencing: 19, knowledge_of_topic: 7, final_grade: 5, paper: new_paper13, feeback_text: "cool project, good job!" )
new_evaluation14 = Evaluation.create!(readability: 6, referencing: 10, knowledge_of_topic: 8, final_grade: 7, paper: new_paper14, feeback_text: "cool project, good job!" )
new_evaluation15 = Evaluation.create!(readability: 5, referencing: 5, knowledge_of_topic: 7, final_grade: 8, paper: new_paper15, feeback_text: "cool project, good job!" )
new_evaluation16 = Evaluation.create!(readability: 7, referencing: 6, knowledge_of_topic: 8, final_grade: 5, paper: new_paper16, feeback_text: "cool project, good job!" )
new_evaluation17 = Evaluation.create!(readability: 8, referencing: 8, knowledge_of_topic: 7, final_grade: 6, paper: new_paper17, feeback_text: "cool project, good job!" )
new_evaluation18 = Evaluation.create!(readability: 6, referencing: 7, knowledge_of_topic: 8, final_grade: 5, paper: new_paper18, feeback_text: "cool project, good job!" )
puts "Status of creating seeds: complete"

