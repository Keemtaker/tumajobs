class UserMailer < ApplicationMailer
  def user_account_confirmation(user)
    @user = user

    attachments.inline["logo.png"] = File.read("#{Rails.root}/app/assets/images/logo.png")

    mail(to: @user.email, subject: 'Welcome to TumaJobs')
  end
end
