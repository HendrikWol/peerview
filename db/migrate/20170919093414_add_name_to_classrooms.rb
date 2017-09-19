class AddNameToClassrooms < ActiveRecord::Migration[5.1]
  def change
    add_column :classrooms, :name, :string
  end
end
