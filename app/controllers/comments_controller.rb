class CommentsController < ApplicationController
  
  before_action :current_user, only: :create

  def create
    micropost = Micropost.find(params[:micropost_id])
    comment = micropost.comments.create(comment_params)
    redirect_to :back
  end

  private

  def comment_params
    params.require(:comment).permit( :content, :parent_id).merge(user: current_user)
  end
end

