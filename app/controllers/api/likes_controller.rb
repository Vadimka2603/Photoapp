module Api
  class LikesController < ApplicationController
    include Authenticatable
    before_action :authenticate

    def index
      @likes = Like.all
      respond_to do |format|
        format.json 
      end
    end

    def create
    outcome = LikeCreate.run!(user: current_user, micropost: Micropost.find(params[:micropost_id]))
      render json: outcome
    end

    def destroy
      like = Like.find(params[:id])
      like.destroy
    end

    
  end
end