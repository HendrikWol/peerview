class CreatePapers < ActiveRecord::Migration[5.1]
  def change
    create_table :papers do |t|
      t.references :assignment, foreign_key: true
      t.references :student, foreign_key: true
      t.references :evaluation, foreign_key: true

      t.timestamps
    end
  end
end
