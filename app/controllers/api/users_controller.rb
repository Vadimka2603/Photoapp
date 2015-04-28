module Api
  class UsersController < ApplicationController
  	include Authenticatable
    before_action :authenticate

    def index
      @users = User..paginate(page: params[:page], per: params[:per])
      if params[:search]
        @users = User.search(params[:search]).paginate(page: params[:page], per: params[:per])
      end

      case params[:sort]
      when "activity"
        @users = @users.order('likes_count + comments_count + microposts_count DESC')
      when "date"
        @users = @users.order(created_at: :desc)
      when "provider"
        @users = @users.order(provider: :desc) 
      else
        @users = @users.order(name: :asc)
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

