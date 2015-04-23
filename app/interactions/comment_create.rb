require 'active_interaction'
class CommentCreate < ActiveInteraction::Base

  model  :micropost
  model  :user
  string :content
  
 
  def execute
    @comment = Comment.create!(inputs)
  end

end