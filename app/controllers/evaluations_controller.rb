class EvaluationsController < ApplicationController
 before_action :set_evaluation, only: [:show, :edit, :update, :destroy]
  def index
    @evaluations = Evaluation.all
    # @assignments = Assignment.all
    @papers = Paper.all
    @student_papers = []
    @papers.each do |paper|
      @student_papers << paper
    end
    @evaluated_paper = display_evaluated_paper(@papers)
  end

  def show

  end

  def new
    @evaluation = Evaluation.new
  end

  def create
    @evaluation = Evaluation.new(evaluation_params)
    @evaluation.student = current_student
    if @evaluation.save
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

  def display_evaluated_paper(all_papers)
    student_papers = []
    all_papers.each do |paper|
      student_papers << paper
    end

    qualified_paper_array = []
    student_papers.each do |student_paper|
      all_papers.each do |paper|
        if (student_paper.assignment.topic == paper.assignment.topic) && (student_paper.assignment.deadline == paper.assignment.deadline )
          !paper.evaluated && (paper.student_id != current_student.id) ? (qualified_paper_array << paper) : nil
        end
      end
    end

      display_paper = qualified_paper_array.shuffle.first
      display_paper ? display_paper.evaluated = true : nil
      display_paper
   end


  def set_evaluation
    @evaluation = Evaluation.find(params[:id])
  end

  def evaluation_params
    params.require(:evaluation).permit(:readability, :referencing, :knowledge_of_topic, :final_grade, :feeback_text, :assignment_id)
  end
end
