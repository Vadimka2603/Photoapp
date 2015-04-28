module Comments
  class Create < ActiveInteraction::Base

    model   :micropost
    model   :user
    string  :content
    
    validates :content, presence: true, length: { maximum: 110 }
  
    def execute
      @comment = Comment.create!(inputs)
    end
  end
end