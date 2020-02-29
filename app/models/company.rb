class Company < ApplicationRecord
  belongs_to :user
  has_many :jobs, dependent: :destroy
end