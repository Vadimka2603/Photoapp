class LikesController < ApplicationController
  include Authenticatable
  def create
    Likes::Create.run!(user: current_user, micropost: Micropost.find(params[:micropost_id]))
    redirect_to :back, :notice => "Вы оценили фото"
  end

  def destroy
    like = Likes::Find.run(params).result
    like.destroy
    redirect_to :back, :notice => "Лайк удален"
  end
end
