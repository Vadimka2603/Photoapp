class UsersController < ApplicationController
  include Authenticatable

  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.paginate(page: params[:page], per: params[:per]).order(created_at: :desc)
    @micropost = current_user.microposts.build if current_user
  end

  def index
    @users = User.paginate(page: params[:page], per: params[:per])
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
      when "microposts_count"
        @users = @users.order(microposts_count: :desc) 
      else
        @users = @users.order(name: :asc)
    end
  end
end

