class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  #validates :phone_number, presence: true
  # validates :phone_number, :format => { :with => /\A(\+1)?[0-9]{10}\z/, :message => 'error! Please use valid 10-digit phone number' },
  #           :uniqueness => true

  has_one :api_key

  protected
  def password_required?
    false
  end

  # def email_required?
  #   false
  # end
  #
  # def email_changed?
  #   false
  # end
end
