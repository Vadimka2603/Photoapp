module Api
  class CommentsController < ApplicationController
    include Authenticatable
  	#before_filter :authenticate

    def index
      @nonull = Comment.where("parent_id is not null").order("parent_id desc")
	  @yesnull = Comment.where("parent_id is null")
	  @wanted = @yesnull+@nonull
      respond_to do |format|
        format.json 
      end
    end

    def show
      @comment = Comment.find(params[:id])
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