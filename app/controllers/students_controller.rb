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
    # The below is related to the first graph
    @student = Student.find(params[:id])
    @papers_to_evaluate = GetEvaluatePapersService.new.call(current_student)
    @chart_input = []
    @evaluations = Evaluation.all
    @assignments = Assignment.all
    @papers = Paper.all
    unless @paper == nil
      student_papers = Paper.where(student_id: current_student.id).where.not(evaluation_id: nil)
      @student_grades_history = []
      student_papers.each do |paper|

        instance_array = [paper.assignment.deadline, paper.evaluation.final_grade]
        @student_grades_history << instance_array
      end
      @student_grades_history
    end

    # The below is related to the second graph
    unless @paper == nil

      student_papers = Paper.where(student_id: current_student.id).where.not(evaluation_id: nil)
      last_paper = student_papers.last
      last_evaluation = last_paper.evaluation
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

  def set_student
    @student = Student.find(params[:id])
  end

  def student_params
    params.require(:student).permit(:first_name, :last_name, :email, :date_of_birth, :description, :city, :classroom_id, :photo, :photo_cache)
  end

end
