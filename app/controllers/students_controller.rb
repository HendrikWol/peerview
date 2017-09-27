class StudentsController < ApplicationController
before_action :set_student, only: [:show, :edit, :update, :destroy]

  def index
    @students = Student.all
  end

  def my_classroom
    @student = current_student
    @classroom = current_student.classroom
  end

  def show
    @student = Student.find(params[:id])
    @papers_to_evaluate = GetEvaluatePapersService.new.call(current_student)
    @chart_input = []
    @evaluations = Evaluation.all
    @assignments = Assignment.all
    @papers = Paper.all
    student_papers = Paper.where(student_id: current_student.id)
    @student_grades_history = []
    student_papers.each do |paper|
      unless paper.evaluation == nil
        instance_array = [paper.assignment.deadline, paper.evaluation.final_grade]
        @student_grades_history << instance_array
      end
    end
    @student_grades_history


    # @evaluations.each do |evaluation|
    #   instance_array = [evaluation.paper.assignment.deadline.strftime("%b %d, %Y"), evaluation.final_grade]
    # @chart_input << instance_array


      student_papers = Paper.where(student_id: current_student.id)
      last_paper = student_papers.last
      last_evaluation = last_paper.evaluation
      unless last_paper.evaluation == nil

        array_final_grade = ['Final Grade', last_evaluation.final_grade]
        array_readability = ['Readbility', last_evaluation.readability]
        array_referencing = ['Referencing', last_evaluation.referencing]
        array_knowledge = ['Knowledge of Topic', last_evaluation.knowledge_of_topic]

        @paper_chart_input = [array_final_grade, array_readability, array_referencing, array_knowledge]
     end
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    if @student.save!
      redirect_to students_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @student.update(student_params)
      redirect_to student_path, notice: 'Student profile was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @student.destroy
    redirect_to students_path
  end




  private
  def set_student
    @student = Student.find(params[:id])
  end

  def student_params
    params.require(:student).permit(:first_name, :last_name, :email, :date_of_birth, :description, :city, :classroom_id, :photo, :photo_cache)
  end

end
