class Assignment < ApplicationRecord
  belongs_to :evaluation
  belongs_to :classroom
  belongs_to :teacher
  belongs_to :topic
end
