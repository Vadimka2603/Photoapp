class MicropostsController < ApplicationController
  before_action :current_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = "Photo added!"
      redirect_to current_user
    else
    	@feed_items = []
      redirect_to current_user
    end
  end

   def destroy
    @micropost.destroy
    flash[:success] = "Photo deleted"
    redirect_to current_user || root_url
  end
   private

    def correct_user
      @micropost = current_user.microposts.find_by(id: params[:id])
      redirect_to current_user if @micropost.nil?
    end

    def micropost_params
      params.require(:micropost).permit(:content, :picture)
    end
end