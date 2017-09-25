class Evaluation < ApplicationRecord
  # belongs_to :assignment
  belongs_to :paper

  validates :readability, presence: true
  validates :referencing, presence: true
  validates :knowledge_of_topic, presence: true
  validates :final_grade, presence: true
  validates :feeback_text, presence: true, length: { minimum: 10 }
end
