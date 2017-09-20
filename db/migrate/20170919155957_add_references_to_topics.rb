class AddReferencesToTopics < ActiveRecord::Migration[5.1]
  def change
    add_reference :topics, :teacher, foreign_key: true, index: true
  end
end
