class CompanyMailer < ApplicationMailer
  def company_account_confirmation(company)
    @company = company

    attachments.inline["logo.png"] = File.read("#{Rails.root}/app/assets/images/logo.png")

    mail(to: @company.user.email, subject: 'Company Account')
  end

end
