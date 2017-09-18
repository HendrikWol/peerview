class CreateEvaluations < ActiveRecord::Migration[5.1]
  def change
    create_table :evaluations do |t|
      t.integer :readability
      t.integer :referencing
      t.integer :knowledge_of_topic
      t.integer :final_grade
      t.text :feeback_text

      t.timestamps
    end
  end
end
