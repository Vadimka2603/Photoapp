module Api
  class CommentsController < ApplicationController
    include Authenticatable
  	#before_filter :authenticate

    def index
      @comments = Comment.all
      respond_to do |format|
        format.json 
      end
    end

	def create
      @comment = Comment.create(comment_params)
       if @comment.save
        render json: @comment
       end
    end

    def comment_params
      params.require(:comment).permit(:micropost_id, :content, :parent_id).merge(user: current_user)
    end
  end
end