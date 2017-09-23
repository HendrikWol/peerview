class PagesController < ApplicationController
  def home
    @teacher = current_teacher
    @student = current_student
  end

end
