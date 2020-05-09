class JobMailer < ApplicationMailer

  def job_post_confirmation(job)
    @job = job
    attachments.inline["logo.png"] = File.read("#{Rails.root}/app/assets/images/logo.png")

    if @job.company_id?
      mail(to: @job.company.user.email, subject: 'Job Post')
    else
      mail(to: @job.unregistered_company_email, subject: 'Job Post')
    end
  end

end
