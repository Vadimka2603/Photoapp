class Micropost < ActiveRecord::Base

  include AASM

  aasm do
    state :moderating, :initial => true
    state :approved
    state :banned

    event :approve do
      transitions :from => [:moderating, :banned], :to => :approved

    end

    event :ban do
      transitions :from => [:moderating, :approved], :to => :banned
    end

  end

  belongs_to :user, :counter_cache => true

  has_many :likes
  has_many :liking_users, through: :likes, :source => :user
  has_many :comments
  has_many :commenting_users, through: :comments, :source => :user

  mount_uploader :picture, PictureUploader

  scope :feed, -> { order(created_at: :desc).take(10) }
  
  
  private

  def picture_size
    if picture.size > 5.megabytes
      raise "should be less than 5MB"
    end
  end
end
