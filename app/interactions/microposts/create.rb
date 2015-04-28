module Microposts
  class Create < ActiveInteraction::Base
    
    string :content
    model  :user
    file   :picture

    validates :content, length: { maximum: 70 }

    def execute
      micropost = Micropost.create(inputs)
    end
  end
end