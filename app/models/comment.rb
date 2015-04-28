# == Schema Information
#
# Table name: comments
#
#  id           :integer          not null, primary key
#  user_id      :integer
#  micropost_id :integer
#  content      :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  parent_id    :integer
#

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


