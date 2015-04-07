class User < ActiveRecord::Base
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

  def feed
    @microposts = Micropost.order("created_at DESC").take(10)
  end

  def all
    @microposts = Micropost.where(ban_status: false).order("likes_count DESC")
  end
end
