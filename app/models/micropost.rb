# == Schema Information
#
# Table name: microposts
#
#  id                  :integer          not null, primary key
#  content             :text
#  user_id             :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  picture             :string
#  aasm_state          :string
#  likes_count         :integer          default(0)
#  comments_count      :integer          default(0)
#  instagram_id        :integer
#  instagram_user_name :string
#

class Micropost < ActiveRecord::Base
  self.per_page = 10
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
