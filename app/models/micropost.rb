class Micropost < ActiveRecord::Base

  belongs_to :user, :counter_cache => true

  has_many :likes
  has_many :liking_users, through: :likes, :source => :user
  has_many :comments
  has_many :commenting_users, through: :comments, :source => :user

  mount_uploader :picture, PictureUploader

  validates :user_id, presence: true
  #validates :picture, presence: true
  validates :content, length: { maximum: 70 }
  validate  :picture_size

  scope :feed, -> { order(created_at: :desc).take(10) }
  scope :legal, -> { where(ban_status: false) }
  
  private

  def picture_size
    if picture.size > 5.megabytes
      errors.add(:picture, "should be less than 5MB")
    end
  end
end
