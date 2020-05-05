class Talent < ApplicationRecord
  belongs_to :job
  mount_uploader :resume, ResumeUploader
  mount_uploader :cover_letter, ResumeUploader

end
