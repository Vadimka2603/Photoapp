require 'active_interaction'
class Create < ActiveInteraction::Base

  string :content
  model :user
  file :picture
 
  def execute
    @micropost = Micropost.create!(inputs)
  end

end