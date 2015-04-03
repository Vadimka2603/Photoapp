class Micropost < ActiveRecord::Base
  belongs_to :user
  has_many :likes
  has_many :liking_users, through: :likes, :source => :user
  has_many :comments
  has_many :commenting_users, through: :comments, :source => :user
  default_scope -> { order(created_at: :desc) }
  mount_uploader :picture, PictureUploader
  validates :user_id, presence: true
  #validates :picture, presence: true
  validates :content, length: { maximum: 70 }
  validate  :picture_size



private

    # Validates the size of an uploaded picture.
    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "should be less than 5MB")
      end
    end
  
end
