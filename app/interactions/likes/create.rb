module Likes
  class Create < ActiveInteraction::Base

  model :micropost
  model :user
	  
	 
    def execute
      @like = Like.create!(inputs)
    end
  end
end