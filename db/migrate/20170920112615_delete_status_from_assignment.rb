class DeleteStatusFromAssignment < ActiveRecord::Migration[5.1]
  def change
    remove_column :assignments, :status, :integer

    add_column :assignments, :status, :integer, default: 0
  end
end
