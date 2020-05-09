class User < ApplicationRecord
  after_create :send_user_account_confirmation

  has_one :company, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :timeoutable,
         :validatable

  private
    def send_user_account_confirmation
       UserMailer.user_account_confirmation(self).deliver_now
    end

end
