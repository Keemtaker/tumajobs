class TalentMailer < ApplicationMailer

  def job_application_confirmation(talent)
    @talent = talent

    mail(to: @talent.email, subject: 'Job Application')
  end

  def talent_info_to_company(talent)
    @talent = talent

    resume_extension = @talent.resume.file.extension
    cover_letter_extension = @talent.cover_letter.file.extension

    attachments["Applicant Resume.#{resume_extension}"] = File.read(@talent.resume.current_path.split('tumajobs/').last)
    attachments["Applicant Cover Letter.#{cover_letter_extension}"] = File.read(@talent.cover_letter.current_path.split('tumajobs/').last)

    mail(to: @talent.job.job_email, subject: 'Job Applicant Details')

  end

end
