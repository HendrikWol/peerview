class AddReferenceToEvaluation < ActiveRecord::Migration[5.1]
  def change
    add_reference :evaluations, :assignment, foreign_key: true, index: true
  end
end
