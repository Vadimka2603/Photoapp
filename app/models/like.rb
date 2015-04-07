class Like < ActiveRecord::Base

  belongs_to :micropost, :counter_cache => true
  belongs_to :user, :counter_cache => true
end
