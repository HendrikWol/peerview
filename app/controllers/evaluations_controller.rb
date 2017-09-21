class EvaluationsController < ApplicationController
  before_action :set_evaluation, only: [:show, :edit, :update, :destroy]
  before_action :set_student

  def index
    @evaluations = Evaluation.all
  end

  def show

  end

  def new
    @evaluation = Evaluation.new
  end

  def create
    @evaluation = Evaluation.new(evaluation_params)
    @evaluation.student = @student

    if @evaluation.save
      redirect_to student_evaluation_path(@student)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @evaluation.update(params[:evaluation])
    redirect_to student_evaluations_path(@student)
  end

  def destroy
    @evaluation.destroy
    redirect_to student_evaluations_path
  end

  private

  def set_student
    @student = Student.find(params[:student_id])
  end

  def set_evaluation
    @evaluation = Evaluation.find(params[:id])
  end

  def evaluation_params
    params.require(:evaluation).permit(:readability, :referencing, :knowledge_of_topic, :final_grade, :feeback_text, :assignment_id)
  end
end
