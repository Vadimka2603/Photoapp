module Api
  class MicropostsController < ApplicationController

    def index
      @microposts = Micropost.all
      respond_to do |format|
        format.json 
        
      end
      
    end

  end
end