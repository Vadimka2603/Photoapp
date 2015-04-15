module Api
  class CommentsController < ApplicationController

    def index
      @comments = Comment.all
      respond_to do |format|
        format.json 
        
      end
      
    end

  end
end