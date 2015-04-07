class Comment < ActiveRecord::Base

  validates :content, presence: true, length: { maximum: 110 }

  belongs_to :micropost, :counter_cache => true
  belongs_to :user, :counter_cache => true
  
  has_many   :answers, class_name: "Comment", foreign_key: "parent_id"
end
