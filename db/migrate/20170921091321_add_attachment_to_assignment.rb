class AddAttachmentToAssignment < ActiveRecord::Migration[5.1]
  def change
    add_column :assignments, :attachment, :string
  end
end
