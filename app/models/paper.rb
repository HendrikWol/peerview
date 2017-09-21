class Paper < ApplicationRecord
  belongs_to :assignment
  belongs_to :student
  belongs_to :evaluation, optional: true

  mount_uploader :attachment, FileUploader
end
