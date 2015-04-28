class UsersController < ApplicationController
  include Authenticatable

  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.paginate(page: params[:page], per_page: 7).order(created_at: :desc)
    @micropost = current_user.microposts.build if current_user
  end

  def index
    @users = User.paginate(page: params[:page], per_page: 7)
    if params[:search]
      @users = User.search(params[:search]).paginate(page: params[:page], per_page: 7)
    end
    @by_id = @users.order(id: :desc)
    @by_name = @users.order(name: :desc) 
  end
end