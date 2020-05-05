class TalentMailer < ApplicationMailer

  def job_application_confirmation(talent)
    @talent = talent
    mail(to: @talent.email, subject: 'Job Application')
  end

  def talent_info(talent)
    @talent = talent
    mail(to: @talent.job.job_email, subject: 'Job Applicant Details')
  end

end
