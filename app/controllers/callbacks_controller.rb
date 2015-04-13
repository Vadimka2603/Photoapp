class CallbacksController < ApplicationController

  def show
  	render json: params['hub.challenge']
  end

  def create
  end

end