class AssignmentsController < ApplicationController
  before_action :set_assignment, only: [:show, :edit, :update, :destroy]

  def index
    @assignments = Assignment.all
  end

  def show

  end

  def new
    @assignment = Assignment.new
  end

  def create
    @assignment = Assignment.new(assignment_params)
    @assignment.teacher_id = current_user
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
    params.require(:assignment).permit(:name, :deadline, :description, :status, :evaluation_id, :classroom_id, :topic_id, :teacher_id, :specs)
  end
end
