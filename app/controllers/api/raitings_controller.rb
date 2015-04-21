module Api
  class RaitingsController < ApplicationController

    def show
      @all_items = Micropost.legal.order(likes_count: :desc).paginate(page: params[:page]) 
    end
  end
end