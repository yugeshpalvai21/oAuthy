class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: %i[github]
  #has_secure_password

  after_create :add_default_role

  validates :username, uniqueness: true

  has_many :posts

  def self.from_omniauth(auth)
    where(email: auth.info.email).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.username = auth.info.nickname
      user.confirmed_at = Time.now
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
  end

  def add_default_role
    self.add_role(:regular)
  end
end
