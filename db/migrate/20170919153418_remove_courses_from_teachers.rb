class RemoveCoursesFromTeachers < ActiveRecord::Migration[5.1]
  def change
    remove_column :teachers, :courses, :string
  end
end
