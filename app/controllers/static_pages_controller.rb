class StaticPagesController < ApplicationController
  include Authenticatable

  
  require 'open-uri'
  require 'nokogiri'

  def home
  	if current_user
  	  @feed_items = Micropost.feed
    end
  end

  def help
    source = 'https://www.betmarathon.com/su/sportstatext.htm?nr5=7725&gmt=3133%2C9'
    page = Nokogiri::HTML(open(source), nil, 'UTF-8')
    @home_team = page.css("td.ss-member.ss-mem-1").map { |x| x.to_s }.join.split"</td>\n<td class=\"ss-member ss-mem-1\">"
    @avay_team = page.css("td.ss-member.ss-mem-2").map { |x| x.to_s }.join.split"</td><td class=\"ss-member ss-mem-2\">"
    @score =     page.css("span.bold").map { |x| x.to_s }.join.split"</span><span class=\"bold\">"
  end

  def raiting
    if current_user
  	  @all_items = Micropost.approved.order(likes_count: :desc).paginate(page: params[:page], per_page: 5)
    end 
  end
end
