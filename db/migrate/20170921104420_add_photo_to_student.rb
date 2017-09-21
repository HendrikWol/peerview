class AddPhotoToStudent < ActiveRecord::Migration[5.1]
  def change
    add_column :students, :photo, :string
  end
end
