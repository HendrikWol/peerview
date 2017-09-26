class EvaluationProcessService
  def initialize(assignment)
    @assignment = assignment
    set_students
  end

  def call
    assign_students
  end

  private

  def set_students
    @evaluators = assignment.classroom.students.map(&:id)
    @evaluated = evaluators.clone
  end

  def assign_students
    until evaluators.empty?
      evaluator_student = get_sample(evaluators)
      evaluated_student = get_sample(evaluated)
      if evaluated_student != evaluator_student
        create_evaluation_and_remove_from_array(evaluated_student, evaluator_student)
      end
    end
  end

  def create_evaluation_and_remove_from_array(evaluated_student, evaluator_student)
    EvaluationProcess.create(
      evaluator_id: evaluators.delete(evaluator_student),
      evaluated_id: evaluated.delete(evaluated_student),
      assignment: assignment
    )
  end

  def get_sample(object)
    object.sample
  end

  attr_reader :assignment, :evaluators, :evaluated
end
