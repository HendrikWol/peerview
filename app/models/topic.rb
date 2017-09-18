class Topic < ApplicationRecord
  belongs_to :program
  has_many :assignments
end
