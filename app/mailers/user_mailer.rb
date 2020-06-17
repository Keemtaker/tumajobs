class UserMailer < ApplicationMailer
  def user_account_confirmation(user)
    @user = user

    mail(to: @user.email, subject: 'Welcome to TumaJobs')
  end
end
