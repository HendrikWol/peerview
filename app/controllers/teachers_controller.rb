class TeachersController < ApplicationController
before_action :set_teacher, only: [:show, :edit, :update, :destroy]

def index
  @teachers = Teacher.all
end

def show
end

def new
@teacher = Teacher.new
end

def create
@teacher = Teacher.new(teacher_params)
# @teacher.user_id = current_user
  if @teacher.save
  redirect_to teachers_path
  else
    render :new
  end
end

def edit
end

def update
  if @teacher.update(teacher_params)
    redirect_to teacher_params, notice: 'Teacher profile was successfully updated.'
  else
    render :edit
  end
end

def destroy
  @teacher.destroy
  redirect_to teachers_path
end

private

def set_teacher
  @teacher = Teacher.find(params[:id])
end

def teacher_params
params.require(:teacher).permit(:first_name, :last_name, :courses, :city, :description, :email)
end

end
