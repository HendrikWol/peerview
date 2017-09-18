class Evaluation < ApplicationRecord
  belongs_to :assignment

  validates :readability, presence: true
  validates :referencing, presence: true
  validates :knowledge_of_topic, presence: true
  validates :final_grade, presence: true
  validates :feedback_text, presence: true, length: { minimum: 200 }
end
