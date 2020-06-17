class CompanyMailer < ApplicationMailer
  def company_account_confirmation(company)
    @company = company

    mail(to: @company.user.email, subject: 'Company Account')
  end

end
