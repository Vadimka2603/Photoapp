# == Schema Information
#
# Table name: users
#
#  id               :integer          not null, primary key
#  provider         :string
#  uid              :string
#  name             :string
#  oauth_token      :string
#  oauth_expires_at :datetime
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  avatar           :string
#  microposts_count :integer          default(0)
#  likes_count      :integer          default(0)
#  comments_count   :integer          default(0)
#

class User < ActiveRecord::Base
  self.per_page = 7

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

  private

  def self.search(search)
    where("name LIKE ?", "%#{search}%") 
  end
end
