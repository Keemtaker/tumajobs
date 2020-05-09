class Job < ApplicationRecord
  after_create :send_job_post_confirmation

  belongs_to :company, optional: true
  has_many :job_perks
  has_many :perks, through: :job_perks, dependent: :destroy
  has_many :talents, dependent: :destroy

  has_rich_text :description
  mount_uploader :unregistered_company_logo, LogoUploader

  private
    def send_job_post_confirmation
       JobMailer.job_post_confirmation(self).deliver_now
    end

end
