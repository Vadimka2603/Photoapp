require 'active_interaction'
class LikeCreate < ActiveInteraction::Base

  model :micropost
  model :user
  
 
  def execute
    @like = Like.create!(inputs)
  end

end