module Api
  class MicropostsController < ApplicationController
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

    private

    def micropost_params
      params.require(:micropost).permit(:user_id, :content, :picture)
    end

  
    protected 

    def authenticate  
      authenticate_token || render_unauthorized 
    end 

    def authenticate_token  
      authenticate_with_http_token do |token, options|  
        User.find_by(auth_token: token) 
      end 
    end

    def render_unauthorized 
      self.headers['WWW-Authenticate'] = 'Token realm="Episodes"' 
      respond_to do |format|  
        format.json { render json: 'Bad credentials', status: 401 } 
        format.xml { render xml: 'Bad credentials', status: 401 } 
      end 
    end

  end
end