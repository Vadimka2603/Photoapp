class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.paginate(page: params[:page])
    @micropost = current_user.microposts.build if current_user
  end

  def index
    @users = User.paginate(page: params[:page])
  end

  def instagram
    default_search = Instagram.tag_search('Rockiesbaseball')
    if params[:q].blank?
      @tag = default_search
    else
      @tag = Instagram.tag_search(params[:q])
    end
    @tag = @tag.first.name
    @results = Instagram.tag_recent_media(@tag, {:count =>10} )
  end

  def callback
  end
end