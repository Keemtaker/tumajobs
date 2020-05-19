class Company < ApplicationRecord
  after_create :send_company_account_confirmation

  belongs_to :user
  has_many :jobs, dependent: :destroy
  has_many :company_perks
  has_many :perks, through: :company_perks, dependent: :destroy
  has_rich_text :description
  mount_uploader :logo, LogoUploader

  validates :name, presence: true
  validates :description, presence: true


  private
    def send_company_account_confirmation
       CompanyMailer.company_account_confirmation(self).deliver_now
    end

end
