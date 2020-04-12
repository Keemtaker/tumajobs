class JobCandidate < ApplicationRecord
  belongs_to :job
  has_one_attached :resume
  has_one_attached :cover_letter
end
