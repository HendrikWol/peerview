class AddTitleToPaper < ActiveRecord::Migration[5.1]
  def change
    add_column :papers, :title, :string
  end
end
