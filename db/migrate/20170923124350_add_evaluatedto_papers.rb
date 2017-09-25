class AddEvaluatedtoPapers < ActiveRecord::Migration[5.1]
  def change
    add_column :papers, :evaluated, :boolean, null: false, default: false 
  end
end
