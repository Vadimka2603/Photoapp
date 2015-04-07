class LikesController < ApplicationController
   
  def create
    micropost = Micropost.find(params[:micropost_id])
    Like.create(:micropost => micropost, :user => current_user)
    redirect_to :back, :notice => "Вы оценили фото"
  end

  def destroy
    like = Like.find(params[:id])
    like.destroy
    redirect_to :back
  end
end
