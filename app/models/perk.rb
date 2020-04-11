class Perk < ApplicationRecord
  has_many :company_perks
  has_many :companies, through: :company_perks
  has_many :job_perks
  has_many :jobs, through: :job_perks
end
