class User < ActiveRecord::Base
  has_many :authentications
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable

  def self.from_omniauth(auth)
    user = User.find_by(uid: auth.uid)
    if user.nil?
      user = User.create(provider: auth.provider, uid: auth.uid, username: auth.info.nickname)
    end
    user
  end

  def self.new_with_session(params, session)
    if session['devise.user_attributes']
      new(session["user_attributes"], without_protection: true) do |user|
        user.attributes = params
        user.valid?
      end
    else
      super
    end
  end

def email_required?
  false
end

def email_changed?
  false
end

  # def password_required?
  #   super && provider.blank?
  # end
end
