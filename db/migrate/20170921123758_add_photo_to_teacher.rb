class AddPhotoToTeacher < ActiveRecord::Migration[5.1]
  def change
    add_column :teachers, :photo, :string
  end
end
