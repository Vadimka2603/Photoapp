class Comment < ActiveRecord::Base

  belongs_to :micropost, :counter_cache => true
  belongs_to :user, :counter_cache => true
  
  has_many   :answers, class_name: "Comment", foreign_key: "parent_id"

  validates :content, presence: true, length: { maximum: 110 }
  validates :micropost, presence: true
  validates :user, presence: true

  def parent_comments
    @comments = Comment.where(parent_id: nil)
  end
end


