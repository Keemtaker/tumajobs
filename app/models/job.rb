class Job < ApplicationRecord
  belongs_to :company, optional: true
  has_many :job_perks
  has_many :perks, through: :job_perks, dependent: :destroy
  has_many :job_candidates, dependent: :destroy

  has_rich_text :description
  has_one_attached :logo
end
