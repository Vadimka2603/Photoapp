module Api
  class MicropostsController < ApplicationController
    include Authenticatable
  	before_action :authenticate
    #http_basic_authenticate_with name: "admin", password: "secret"
    def index
      @microposts = Micropost.paginate(page: params[:page]).order(comments_count: :desc)
      respond_to do |format|
        format.json 
      end
    end

    def create
    outcome = MicropostCreate.run!(params[:micropost].merge( user: current_user))
      render json: outcome
    end

    def show
      @micropost = Micropost.find(params[:id])
    end

    def destroy
      micropost = Micropost.find(params[:id])
      micropost.destroy
      render json: @micropost
    end
  end
end