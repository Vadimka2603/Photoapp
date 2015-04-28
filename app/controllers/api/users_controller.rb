module Api
  class UsersController < ApplicationController
  	include Authenticatable
    before_action :authenticate

    def index
      @users = User.paginate(page: params[:page], per_page: 7)
      if params[:search]
        @users = User.search(params[:search]).paginate(page: params[:page], per_page: 7)
      end
    end

    def show
      @user = User.find(params[:id])
    end

    def current
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

  end
end

