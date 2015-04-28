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

require 'test_helper'

class MicropostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
