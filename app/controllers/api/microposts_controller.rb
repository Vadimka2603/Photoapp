module Api
  class MicropostsController < ApplicationController
  	
    http_basic_authenticate_with name: "admin", password: "secret"
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

    private

    def micropost_params
      params.require(:micropost).permit(:user_id, :content, :picture)
    end
  end
end