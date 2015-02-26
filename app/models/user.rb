class User < ActiveRecord::Base
  has_many :authentications
  has_secure_password

  def email_required?
    false
  end

  def email_changed?
    false
  end
end
