class Talent < ApplicationRecord
  after_create :send_job_application_confirmation, :send_talent_info_to_company

  belongs_to :job
  mount_uploader :resume, ResumeUploader
  mount_uploader :cover_letter, ResumeUploader

  validates :full_name, presence: true
  validates :email, presence: true, format: Devise.email_regexp
  validates :mobile_number, presence: true
  validates :resume, presence: true
  validates :cover_letter, presence: true

  private
    def send_job_application_confirmation
       TalentMailer.job_application_confirmation(self).deliver_now
    end

    def send_talent_info_to_company
       TalentMailer.talent_info_to_company(self).deliver_now
    end

end
