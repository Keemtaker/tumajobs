class Talent < ApplicationRecord
  after_create :send_job_application_confirmation

  belongs_to :job
  mount_uploader :resume, ResumeUploader
  mount_uploader :cover_letter, ResumeUploader

  private
    def send_job_application_confirmation
       TalentMailer.job_application_confirmation(self).deliver_now
    end

    def send_talent_info
       TalentMailer.talent_info(self).deliver_now
    end

end
