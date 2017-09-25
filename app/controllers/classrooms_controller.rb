class ClassroomsController < ApplicationController

  def show
    @classroom = Classroom.find(params[:id])
    @teacher = current_teacher
    @student = current_student
  end
end
