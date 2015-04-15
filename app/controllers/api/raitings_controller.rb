module Api
  class RaitingsController < ApplicationController

    def show
      @all_items = Micropost.legal.order(likes_count: :desc) 
        
   
      
    end

  end
end