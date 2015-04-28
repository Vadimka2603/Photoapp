module Api
  class MicropostsController < ApplicationController
    include Authenticatable
  	before_action :authenticate

    def index
      @microposts = Micropost.paginate(page: params[:page], per: params[:per]).order(comments_count: :desc)
    end

    def create
    outcome = Microposts::Create.run!(params[:micropost].merge( user: current_user))
      render json: outcome
    end

    def destroy
      micropost = Microposts::Find.run(params).result
      micropost.destroy
      render json: @micropost
    end

    def show
      @micropost = Microposts::Find.run(params).result
    end
  end
end