class AssignmentsController < ApplicationController
  before_action :set_assignment, only: [:show, :edit, :update, :destroy]

  def index
    @assignments = Assignment.all
    # @assignments = Assignment.all.where(@assignment.deadline < Date.today)

  end

  def show

  end

  def new
    @assignment = Assignment.new
  end

  def my_assignments
    @assignments = Assignment.where(deadline: == Date.today)
  end

  def create
    @assignment = Assignment.new(assignment_params)
    # @assignment.student_id = current_student
    if @assignment.save
      redirect_to assignments_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @assignment.update(params[:assignment])
    redirect_to assignment_path(@assignment)
  end

  def destroy
    @assignment.destroy
    redirect_to assignments_path
  end

  private

  def set_assignment
    @assignment = Assignment.find(params[:id])
  end

  def assignment_params
    params.require(:assignment).permit(:name, :deadline, :description, :status, :evaluation_id, :classroom_id, :teacher_id, :specs)
  end
end
