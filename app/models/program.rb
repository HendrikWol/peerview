class Program < ApplicationRecord
  has_many :topics

  validates :name, presence: true
end
