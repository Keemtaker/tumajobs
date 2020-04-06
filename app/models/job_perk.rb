class JobPerk < ApplicationRecord
  belongs_to :job
  belongs_to :perk
end
