class AddAttachmentToPaper < ActiveRecord::Migration[5.1]
  def change
    add_column :papers, :attachment, :string
  end
end
