class Assignment < ApplicationRecord
  belongs_to :evaluation, optional: true
  belongs_to :classroom
  belongs_to :teacher
  belongs_to :topic, optional: true
  has_many :papers
  has_many :ev_process, foreign_key: 'assignment_id' , class_name: 'EvaluationProcess'
  validates :name, presence: true
  validates :deadline, presence: true
  validates :description, presence: true, length: { minimum: 20 }
  enum status: [:pending, :submitted, :evaluated, :not_submitted]

  # mount_uploader :attachment, FileUploader
end
