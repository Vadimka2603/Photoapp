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

    def destroy
      micropost = FindMicropost.run(params).result
      micropost.destroy
      render json: @micropost
    end

    def show
      @micropost = FindMicropost.run(params).result
    end
  end
end