class User < ActiveRecord::Base
	has_many :microposts, dependent: :destroy
	def self.from_omniauth(auth)
  where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
    user.provider = auth.provider 
    user.uid      = auth.uid
    user.name     = auth.info.name
    user.save
  end
end

def feed
    @microposts = Micropost.all
  end
end
