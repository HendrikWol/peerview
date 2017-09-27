class GetEvaluatePapersService

  def call(current_student)

      evs = EvaluationProcess.where(evaluator: current_student)
      result = evs.map do |evaluation|
        paper = Paper.where(assignment: evaluation.assignment, student: evaluation.evaluated)
        paper.empty? ? next : paper
      end
      result.compact!
      result.flatten!
  end
end
