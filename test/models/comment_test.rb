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

require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
