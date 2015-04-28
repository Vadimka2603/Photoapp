class StaticPagesController < ApplicationController
  include Authenticatable
  def home
  	if current_user
  	  @feed_items = Micropost.feed
    end
  end

  def help
  end

  def raiting
    if current_user
  	  @all_items = Micropost.approved.order(likes_count: :desc).paginate(page: params[:page])
    end 
  end
end
