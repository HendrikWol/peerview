class PapersController < ApplicationController
  before_action :set_paper, only: [:show, :edit, :update, :destroy]
  before_action :set_assignment
  def index
    @papers = Paper.all
  end

  def show

  end

  def new
    @paper = Paper.new
  end

  def create
    @paper = Paper.new(paper_params)
    @paper.student = current_student
    @paper.assignment = @assignment
    if @paper.save
      redirect_to assignment_papers_path(@assignment)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @paper.update(params[:paper])
    redirect_to evaluation_path(@evaluation)
  end

  def destroy
    @paper.destroy
    redirect_to evaluations_path
  end

  private

  def set_assignment
    @assignment = Assignment.find(params[:assignment_id])
  end

  def set_paper
    @paper = Paper.find(params[:id])
  end

  def paper_params
    params.require(:paper).permit(:id, :assignment_id, :student_id, :evaluation_id, :attachment, :attachment_cache)
  end
end
