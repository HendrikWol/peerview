class Assignment < ApplicationRecord
  belongs_to :evaluation
  belongs_to :classroom
  belongs_to :teacher
  belongs_to :topic

  validates :name, presence: true
  validates :deadline, presence: true
  validates :description, presence: true, length: { minimum: 20 }

end
