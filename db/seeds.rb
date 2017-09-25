# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Evaluation.destroy_all
Paper.destroy_all
Assignment.destroy_all
Topic.destroy_all
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
new_student4 = Student.new(first_name: "Darth", last_name: "Vader", email: "darth@hotmail.com", password: "darth@hotmail.com", date_of_birth: Date.today, description: "Lord sith who wants to conquer the world", city: "Paris", classroom_id: new_classroom1.id)
new_student4.save
new_student5 = Student.new(first_name: "Hans", last_name: "Solo", email: "solo@hotmail.com", password: "solo@hotmail.com", date_of_birth: Date.today, description: "Best pilot in the galaxy", city: "London", classroom_id: new_classroom1.id)
new_student5.save
new_student6 = Student.new(first_name: "Lea", last_name: "Skywalker", email: "lea@hotmail.com", password: "lea@hotmail.com", date_of_birth: Date.today, description: "Princess and leader of resistance", city: "Los Angeles", classroom_id: new_classroom1.id)
new_student6.save
new_student7 = Student.new(first_name: "Noel", last_name: "Gallagher", email: "oasis1@hotmail.com", password: "oasis1@hotmail.com", date_of_birth: Date.today, description: "I am the best singer in the world despite of what Liam says", city: "Manchester", classroom_id: new_classroom1.id)
new_student7.save
new_student8 = Student.new(first_name: "Liam", last_name: "Gallagher", email: "liam@hotmail.com", password: "liam@hotmail.com", date_of_birth: Date.today, description: "Definitely better singer than my brother", city: "Machester", classroom_id: new_classroom1.id)
new_student8.save
new_student9 = Student.new(first_name: "Mick", last_name: "Jagger", email: "mick@hotmail.com", password: "mick@hotmail.com", date_of_birth: Date.today, description: "It's time for rock and roll, babe!", city: "Liverpool", classroom_id: new_classroom1.id)
new_student9.save

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

new_assignment1 = Assignment.create(name: "Report on the WWII", deadline: Date.today + 10.days , description: "Report about the entrepreneurship during the war", classroom_id: new_classroom1.id, teacher_id: new_teacher2.id, topic_id: new_topic1.id)
new_assignment2 = Assignment.create(name: "Report on Adam Smith ideas", deadline: Date.today + 5.days, description: "Report about the entrepreneurship of Adam Smith", classroom_id: new_classroom2.id, teacher_id: new_teacher1.id, topic_id: new_topic2.id)
new_assignment3 = Assignment.create(name: "Report on the US under Trump", deadline: Date.today + 4.days, description: "Report about the economy during the Donald Trump ", classroom_id: new_classroom3.id, teacher_id: new_teacher3.id, topic_id: new_topic3.id)
new_assignment4 = Assignment.create(name: "Report on business and sports", deadline: Date.today + 7.days, description: "Report about the impact of soccer in Europe's economy", classroom_id: new_classroom1.id, teacher_id: new_teacher1.id, topic_id: new_topic1.id)
new_assignment5 = Assignment.create(name: "Report xx on business and sports", deadline: Date.today - 30.days, description: "Report xxx about the impact of soccer in Europe's economy", classroom_id: new_classroom1.id, teacher_id: new_teacher1.id, topic_id: new_topic1.id)
new_assignment6 = Assignment.create(name: "Report xx on business and sports", deadline: Date.today - 60.days, description: "Report yyy about the impact of soccer in Europe's economy", classroom_id: new_classroom1.id, teacher_id: new_teacher1.id, topic_id: new_topic1.id)

paper1 = Paper.create(title: "Assignment on life and death", student: new_student3, assignment: new_assignment1)
paper2 = Paper.create(title: "Assignment on back and white", student: new_student2, assignment: new_assignment2)
paper3 = Paper.create(title: "Assignment on back and white", student: new_student4, assignment: new_assignment2)

paper4 = Paper.create(title: "Assignment on back and white", student: new_student2, assignment: new_assignment3)
paper5 = Paper.create(title: "Assignment on back and white", student: new_student2, assignment: new_assignment4)
paper6 = Paper.create(title: "Assignment on back and white", student: new_student2, assignment: new_assignment5)
paper7 = Paper.create(title: "Assignment on back and white", student: new_student2, assignment: new_assignment6)

new_Evaluation1 = Evaluation.create(readability: 8, referencing: 9, knowledge_of_topic: 7, final_grade: 9, feeback_text: "A nice feedback to have",  paper: paper1)
new_Evaluation2 = Evaluation.create(readability: 7, referencing: 8, knowledge_of_topic: 7, final_grade: 8, feeback_text: "A super nice feedback to have", paper: paper1)
new_Evaluation3 = Evaluation.create(readability: 6, referencing: 5, knowledge_of_topic: 5, final_grade: 5, feeback_text: "A really super nice feedback to have", paper: paper2)
new_Evaluation3 = Evaluation.create(readability: 8, referencing: 9, knowledge_of_topic: 9, final_grade: 9, feeback_text: "A really super nice feedback to have", paper: paper3)
new_Evaluation1 = Evaluation.create(readability: 2, referencing: 9, knowledge_of_topic: 7, final_grade: 6, feeback_text: "A nice feedback to have",  paper: paper4)
new_Evaluation2 = Evaluation.create(readability: 7, referencing: 8, knowledge_of_topic: 7, final_grade: 3, feeback_text: "A super nice feedback to have", paper: paper5)
new_Evaluation3 = Evaluation.create(readability: 6, referencing: 5, knowledge_of_topic: 5, final_grade: 4, feeback_text: "A really super nice feedback to have", paper: paper6)
new_Evaluation3 = Evaluation.create(readability: 8, referencing: 9, knowledge_of_topic: 9, final_grade: 10, feeback_text: "A really super nice feedback to have", paper: paper7)
