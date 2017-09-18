class AddEmailToTeachers < ActiveRecord::Migration[5.1]
  def change
    add_column :teachers, :email, :string
  end
end
