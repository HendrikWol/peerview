class EvaluationsController < ApplicationController
 before_action :set_evaluation, only: [:show, :edit, :update, :destroy]
 before_action :set_paper, only: [:new, :create]
  def index
    @evaluations = Evaluation.all
    # @assignments = Assignment.all
    @papers = Paper.all
    @student_papers = []
    @papers.each do |paper|
      @student_papers << paper
    end
    @evaluated_paper = display_evaluated_paper(@papers)
    @papers_to_evaluate = GetEvaluatePapersService.new.call(current_student)
  end

  def show

  end

  def new
    @evaluation = Evaluation.new
  end

  def create
    @evaluation = Evaluation.new(evaluation_params)
    @evaluation.paper = @paper
    if @evaluation.save
      @paper.evaluation = @evaluation
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

    def student_dashboard
    @chart_input = []
    @evaluations = Evaluation.all
    @evaluations.each do |evaluation|
      instance_array = [evaluation.paper.assignment.deadline.strftime("%b %d, %Y"), evaluation.final_grade]
      @chart_input << instance_array
    end
    @chart_input



    total_final = 0
    number_final = 0
    array_of_averages = []
    current_student.classroom.students.each do |student|
      student.papers.each do |paper|
        total_final = total_final + paper.evaluation.final_grade
        number_final = number_final + 1
      end
    student_average_total_grade = total_final / number_final
    array_of_averages << student_average_total_grade
  end

  array_of_averages.sort!
    total_final = 0
    number_final = 0
     current_student.papers.each do |paper|

    total_final = total_final + paper.evaluation.final_grade
        number_final = number_final + 1
      end
      current_student_average = total_final / number_final



  overall_ranking =  1 + array_of_averages.index(current_student_average)



  overall_percentile = 1 - overall_ranking / array_of_averages.length










    readability_percentile = 1 - readability_ranking / classroom_size
    referencing_percentile = 1 - referencing_ranking / classroom_size
    knowledge_percentile = 1 - knowledge_ranking / classroom_size


    @bar_chart_input = [overall_array, readability_array, referencing_array, knowledge_array]

    # @chart_input = Evaluation.pluck(:readability, :final_grade)
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

  def set_paper
    @paper = Paper.find(params[:paper_id])
  end


end
