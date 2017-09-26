class EvaluationProcess < ApplicationRecord
  belongs_to :assignment
  belongs_to :evaluated, class_name: 'Student', foreign_key: 'evaluated_id'
  belongs_to :evaluator, class_name: 'Student', foreign_key: 'evaluator_id'
end
