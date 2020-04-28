class Company < ApplicationRecord
  belongs_to :user
  has_many :jobs, dependent: :destroy
  has_many :company_perks
  has_many :perks, through: :company_perks, dependent: :destroy
  has_rich_text :description
  mount_uploader :logo, LogoUploader
end
