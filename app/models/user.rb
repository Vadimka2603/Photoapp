class User < ActiveRecord::Base

  before_create :set_auth_token

	has_many :microposts, dependent: :destroy
  has_many :likes
  has_many :liked_microposts, through: :likes, :source => :micropost
  has_many :comments
  has_many :commented_microposts, through: :comments, :source => :micropost

  mount_uploader :avatar, AvatarUploader

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider 
      user.uid      = auth.uid
      user.name     = auth.info.name
      user.remote_avatar_url = auth.info.image
      user.save
    end
  end

  def liking?(micropost)
    liked_microposts.include?(micropost)
  end

  def set_auth_token  
    return if auth_token.present? 
    self.auth_token = generate_auth_token 
  end

  def generate_auth_token 
    loop do 
      token = SecureRandom.hex  
      break token unless self.class.exists?(auth_token: token)  
    end 
  end

end
