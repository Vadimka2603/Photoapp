module Api
  class LikesController < ApplicationController
    include Authenticatable
    before_action :authenticate

    def index
      @micropost = Micropost.find(params[:micropost_id])
      @likes = @micropost.likes
    end

    def create
    outcome = Likes::Create.run!(user: current_user, micropost: Micropost.find(params[:micropost_id]))
      render json: outcome
    end

    def destroy
      like = Likes::Find.run(params).result
      like.destroy
    end

    def show
      @like = Likes::Find.run(params).result
    end
  end
end