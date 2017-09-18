class CreateAssignments < ActiveRecord::Migration[5.1]
  def change
    create_table :assignments do |t|
      t.string :name
      t.date :deadline
      t.text :description
      t.integer :status
      t.references :evaluation, foreign_key: true
      t.references :classroom, foreign_key: true
      t.references :teacher, foreign_key: true
      t.references :topic, foreign_key: true

      t.timestamps
    end
  end
end
