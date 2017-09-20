class Topic < ApplicationRecord
  belongs_to :program, dependent: :destroy
  has_many :assignments
  belongs_to :teacher

  # validates :name, presence: true
end
