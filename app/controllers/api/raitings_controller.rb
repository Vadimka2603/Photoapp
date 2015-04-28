module Api
  class RaitingsController < ApplicationController

    def show
      @all_items = Micropost.approved.order(likes_count: :desc).paginate(page: params[:page], per_page: 7) 
    end

  end
end