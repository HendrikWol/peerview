class AddSpecsToAssignments < ActiveRecord::Migration[5.1]
  def change
    add_column :assignments, :specs, :text
  end
end
