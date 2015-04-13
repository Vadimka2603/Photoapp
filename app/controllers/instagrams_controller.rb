class InstagramsController < ApplicationController
  
  def show
  	render json: params['hub.challenge']
  end
 # Instagram.create_subscription("user", "https://shrouded-garden-5776.herokuapp.com/instagram/callback")