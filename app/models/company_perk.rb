class CompanyPerk < ApplicationRecord
  belongs_to :company
  belongs_to :perk
end
