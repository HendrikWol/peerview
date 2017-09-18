class Topic < ApplicationRecord
  belongs_to :program, dependent: :destroy
  has_many :assignments

  validates :name, presence: true
end
