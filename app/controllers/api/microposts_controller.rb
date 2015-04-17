module Api
  class MicropostsController < ApplicationController
    include Authenticatable
  	before_action :authenticate
    #http_basic_authenticate_with name: "admin", password: "secret"
    def index
      @microposts = Micropost.all
      respond_to do |format|
        format.json 
      end
    end

    def create
    @micropost = Micropost.create(micropost_params)
      if @micropost.save
        render json: @micropost
      end
    end

    def show
      @micropost = Micropost.find(params[:id])
    end

    def destroy
      micropost = Micropost.find(params[:id])
      micropost.destroy
      render json: @micropost
    end


    private

    def micropost_params
      params.require(:micropost).permit(:content, :picture).merge(user: current_user)
    end
  end
end