  class EvaluationsController < ApplicationController
 before_action :set_evaluation, only: [:show, :edit, :update, :destroy]
 before_action :set_paper, only: [:new, :create]
 def index
  @evaluations = Evaluation.all
    # @assignments = Assignment.all
    @papers = Paper.all
    @student_papers = Paper.where(student_id: current_student.id)
    @papers_to_evaluate = GetEvaluatePapersService.new.call(current_student)

  end

  def show
    # evaluator_object = Student.find_by(id: @evaluation.evaluation_processes.evaluator_id)
    # @evaluator_name = evaluator_object.name
  end

  def new
    @evaluation = Evaluation.new
  end

  def create
    @evaluation = Evaluation.new(evaluation_params)
    @evaluation.paper = @paper
    if @evaluation.save
      @paper.evaluation = @evaluation
      @paper.evaluated = true
      @paper.save
      redirect_to evaluations_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @evaluation.update(params[:evaluation])
    redirect_to evaluation_path(@evaluation)
  end

  def destroy
    @evaluation.destroy
    redirect_to evaluations_path
  end


  private

  def set_evaluation
    @evaluation = Evaluation.find(params[:id])
  end

  def evaluation_params
    params.require(:evaluation).permit(:readability, :referencing, :knowledge_of_topic, :final_grade, :feeback_text, :assignment_id)
  end

  def set_paper
    @paper = Paper.find(params[:paper_id])
  end


end
