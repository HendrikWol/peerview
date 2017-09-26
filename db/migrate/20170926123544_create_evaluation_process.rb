class CreateEvaluationProcess < ActiveRecord::Migration[5.1]
  def change
    create_table :evaluation_processes do |t|
      t.references :assignment, foreign_key: true, index: true
      t.integer :evaluated_id, index: true
      t.integer :evaluator_id, index: true
    end
  end
end
