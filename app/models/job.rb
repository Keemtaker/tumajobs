class Job < ApplicationRecord
  belongs_to :company, optional: true
  has_many :job_perks
  has_many :perks, through: :job_perks, dependent: :destroy
  has_many :talents, dependent: :destroy

  has_rich_text :description
  mount_uploader :unregistered_company_logo, LogoUploader
end
