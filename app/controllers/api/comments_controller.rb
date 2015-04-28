module Api
  class CommentsController < ApplicationController
    include Authenticatable
  	
    def index
      @comment = Comment.where(parent_id: nil).order(parent_id: :desc).paginate(page: params[:page], per: params[:per])
	  end

    def show
      @comment = Comment.find(params[:id])
    end

	  def create
      outcome = Comments::Create.run!(params[:comment].merge( user: current_user, micropost: Micropost.find(params[:micropost_id])))
      render json: outcome
    end
  end
end