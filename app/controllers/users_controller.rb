class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.paginate(page: params[:page]).order(created_at: :desc)
    @micropost = current_user.microposts.build if current_user
  end

  def index
    @users = User.paginate(page: params[:page])
  end

  end