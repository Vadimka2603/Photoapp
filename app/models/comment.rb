class Comment < ActiveRecord::Base
  validates :content, presence: true
  validates :content, length: { maximum: 110 }
  belongs_to :micropost
  belongs_to :user
  #has_many   :answers, class_name: "Comment",
                         # foreign_key: "parent_id"
end
