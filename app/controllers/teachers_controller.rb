class TeachersController < ApplicationController
  before_action :set_teacher, only: [:show, :edit, :update, :destroy]

  def index
    @teachers = Teacher.all
  end

  def show
    # The method below is for the first graph
    @teacher_graph_input = []
    @evaluations = Evaluation.all
    @assignments = Assignment.all
    @papers = Paper.all
    teacher_papers = []
    @papers.each do |paper|
      teacher_papers << paper if (paper.assignment.topic.teacher.id == current_teacher.id) && (!paper.evaluation_id.nil?)
    end
    teacher_papers.each do |paper|
      instance_array = [paper.student.first_name, paper.evaluation.final_grade]
      @teacher_graph_input << instance_array
    end
    @teacher_graph_input
    new_a = @teacher_graph_input.reduce({}){ |first_name, grade| first_name[grade[0]] ||= []; first_name[grade[0]] << grade[1]; first_name}
    students_averages = new_a.map do |k,v|
      sum = 0
      v.each{ |a| sum+=a }
      average = sum/v.length
      [k, average]
    end
    @students_averages_sorted = students_averages.sort do |a, b|
     b[1] <=> a[1]
   end
  #  The method below is for the second graph
  @teacher_evolution_input = []
  teacher_papers2 = []
  @papers.each do |paper|
    teacher_papers2 << paper if paper.assignment.topic.teacher.id == current_teacher.id &&(!paper.evaluation_id.nil?)

  end
  teacher_papers2.each do |paper|
    @teacher_evolution_input << [paper.assignment.name, paper.evaluation.final_grade]
  end
  new_b = @teacher_evolution_input.reduce({}){ |deadline, grade| deadline[grade[0]] ||= []; deadline[grade[0]] << grade[1]; deadline}
  assignment_averages = new_b.map do |k,v|
    sum = 0
    v.each{ |a| sum+=a }
    average = sum/v.length
    [k, average]
  end
  @assignment_averages_sorted = assignment_averages.sort do |a, b|
    b[1] <=> a[1]
  end




end

def new
  @teacher = Teacher.new
end


def create
  @teacher = Teacher.new(teacher_params)
# @teacher.user_id = current_user
if @teacher.save
  redirect_to teachers_path
else
  render :new
end
end

def edit
end

def update
  if @teacher.update(teacher_params)
    redirect_to teacher_params, notice: 'Teacher profile was successfully updated.'
  else
    render :edit
  end
end

def destroy
  @teacher.destroy
  redirect_to teachers_path
end

private

def set_teacher
  @teacher = Teacher.find(params[:id])
end

def teacher_params
  params.require(:teacher).permit(:first_name, :last_name, :courses, :city, :description, :email, :photo, :photo_cache)
end

end
