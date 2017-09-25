class RemoveAssignmentFromEvaluationAndAddPaperToEvaluation < ActiveRecord::Migration[5.1]
  def change
    remove_reference :evaluations, :assignment, foreign_key: true
    add_reference :evaluations, :paper, foreign_key: true
  end
end
