class StudentsController < ApplicationController
before_action :set_student, only: [:show, :edit, :update, :destroy]

  def index
    @students = Student.all
  end

  # def my_profile
  #   @profile = current_user.profile
  # end

  def show
    @student = Student.find(params[:id])
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
