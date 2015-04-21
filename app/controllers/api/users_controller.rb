module Api
  class UsersController < ApplicationController
  	include Authenticatable
    before_action :authenticate

    def index
      @users = User.paginate(page: params[:page])
      respond_to do |format|
        format.json 
      end
    end

    def show
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

  end
end