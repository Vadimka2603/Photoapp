module Api
  class LikesController < ApplicationController
    include Authenticatable
    #before_filter :authenticate

    def index
      @likes = Like.all
      respond_to do |format|
        format.json 
      end
    end

    def create
      @like = Like.create(comment_params)
       if @like.save
        render json: @like
       end
    end

    def destroy
      like = Like.find(params[:id])
      like.destroy
    end

    def comment_params
      params.require(:like).permit(:micropost_id).merge(user: current_user)
    end
  end
end