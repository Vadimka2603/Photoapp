class StaticPagesController < ApplicationController
  def home
  	if current_user
  	@feed_items = current_user.feed
  end
end

  def help
  end

  def raiting
    if current_user
  	@all_items = current_user.all.paginate(page: params[:page])
    end 
  end

end
