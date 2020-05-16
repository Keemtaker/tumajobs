class Job < ApplicationRecord
  after_create :send_job_post_confirmation

  belongs_to :company, optional: true
  has_many :job_perks
  has_many :perks, through: :job_perks, dependent: :destroy
  has_many :talents, dependent: :destroy

  has_rich_text :description
  mount_uploader :unregistered_company_logo, LogoUploader

  validates :title, presence: true
  validates :description, presence: true
  validates :role, presence: true
  validates :location, presence: true
  validates :job_type, presence: true
  validates :salary, presence: true
  validates :job_email, presence: true, if: -> { self.job_application_type == "Email" }
  validates :job_url, presence: true, if: -> { self.job_application_type == "Url" }


  private
    def send_job_post_confirmation
       JobMailer.job_post_confirmation(self).deliver_now
    end

end
