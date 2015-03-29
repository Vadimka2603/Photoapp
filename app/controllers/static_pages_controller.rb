class StaticPagesController < ApplicationController
  def home
  	if current_user
  	@feed_items = current_user.feed
  end
end

  def help
  end

  def raiting
  end
end
