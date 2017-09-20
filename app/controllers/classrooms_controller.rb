class ClassroomsController < ApplicationController

  def show
    @classroom = Classroom.find(params[:id])
  end
end
