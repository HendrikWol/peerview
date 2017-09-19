class Teacher < ApplicationRecord
  has_many :assignments

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
end
