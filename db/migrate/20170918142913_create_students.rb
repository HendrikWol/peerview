class CreateStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :students do |t|
      t.string :first_name
      t.string :last_name
      t.string :city
      t.date :date_of_birth
      t.text :description
      t.references :classroom, foreign_key: true

      t.timestamps
    end
  end
end
