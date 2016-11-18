class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,:omniauthable,omniauth_providers:[:twitter]
  has_many :user_goals, dependent: :destroy
  has_many :endurances, dependent: :destroy

def self.find_for_twitter_oauth(auth, signed_in_resource=nil)
     user = User.where(:provider => auth.provider, :id => auth.uid).first
    unless user
      user = User.create(
                         provider: auth.provider,
                         id:      auth.uid,
                         email:    User.create_unique_email,
                         password: Devise.friendly_token[0,20],
                         name: auth.info.nickname
                        )
    end
    user
  end
 
  # 通常サインアップ時のuid用、Twitter OAuth認証時のemail用にuuidな文字列を生成
  def self.create_unique_string
    SecureRandom.uuid
  end
 
  # twitterではemailを取得できないので、適当に一意のemailを生成
  def self.create_unique_email
    User.create_unique_string + "@example.com"
  end 
has_many :endurances  
 
end

