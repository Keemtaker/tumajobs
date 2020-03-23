class Perk < ApplicationRecord
  has_many :company_perks
  has_many :companies, through: :company_perks
end
