module Api
  class CommentsController < ApplicationController
    include Authenticatable
  	#before_filter :authenticate

    def index
      @comment = Comment.where(parent_id: nil).order(parent_id: :desc)
	    respond_to do |format|
      format.json 
      end
    end

    def show
      @comment = Comment.find(params[:id])
    end

	  def create
      outcome = CommentCreate.run!(params[:comment].merge( user: current_user, micropost: Micropost.find(params[:micropost_id])))
      render json: outcome
    end

    def comment_params
      params.require(:comment).permit(:micropost_id, :content, :parent_id).merge(user: current_user)
    end
  end
end