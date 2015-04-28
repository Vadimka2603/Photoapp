# == Schema Information
#
# Table name: likes
#
#  id           :integer          not null, primary key
#  user_id      :integer
#  micropost_id :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Like < ActiveRecord::Base

  belongs_to :micropost, counter_cache: true
  belongs_to :user, counter_cache: true
end
