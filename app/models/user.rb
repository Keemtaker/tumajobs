class User < ApplicationRecord
  has_one :company, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :timeoutable,
         :validatable
end
