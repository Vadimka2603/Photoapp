class Micropost < ActiveRecord::Base

  belongs_to :user, :counter_cache => true

  has_many :likes
  has_many :liking_users, through: :likes, :source => :user
  has_many :comments
  has_many :commenting_users, through: :comments, :source => :user

  mount_uploader :picture, PictureUploader

  validates :user_id, :picture, presence: true
  validates :content, length: { maximum: 70 }
  validate  :picture_size

  def all
    @microposts = Micropost.where(ban_status: false).order("likes_count DESC")
  end

  private

  def picture_size
    if picture.size > 5.megabytes
      errors.add(:picture, "should be less than 5MB")
    end
  end
end
