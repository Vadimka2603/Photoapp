class LikesController < ApplicationController
   
  def create
    micropost = Micropost.find(params[:micropost_id])
    Like.create(:micropost => micropost, :user => current_user)
    redirect_to :back, :notice => "You just liked the photo"
  end

  def destroy
    like = Like.find(params[:id])
    like.destroy
    redirect_to :back, :notice => "You just disliked the photo"
  end
end
