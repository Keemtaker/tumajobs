class Job < ApplicationRecord
  after_create :send_job_post_confirmation
  attr_accessor :unregistered_company_validation
  after_validation :set_slug, only: [:create, :update]

  def to_param
    "#{id}-#{slug}"
  end

  belongs_to :company, optional: true
  has_many :job_perks
  has_many :perks, through: :job_perks, dependent: :destroy
  has_many :talents, dependent: :destroy
  has_rich_text :description
  mount_uploader :unregistered_company_logo, JobUploader


  validates :title, presence: true
  validates :description, presence: true
  validates :role, presence: true
  validates :location, presence: true
  validates :job_type, presence: true
  validates :salary, presence: true
  validates :job_email, presence: true, if: -> { self.job_application_type == "Email" }, format: Devise.email_regexp
  validates :job_url, presence: true, if: -> { self.job_application_type == "Url" }
  validates :unregistered_company_name, presence: true, if: -> { unregistered_company_validation }
  validates :unregistered_company_email, presence: true, if: -> { unregistered_company_validation }, format: Devise.email_regexp

  def generate_unique_secure_token
    SecureRandom.base58(24)
  end

  private

  def send_job_post_confirmation
     JobMailer.job_post_confirmation(self).deliver_now
  end

  def set_slug
    self.slug = title.to_s.parameterize
  end
end
