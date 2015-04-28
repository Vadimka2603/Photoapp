class MicropostsController < ApplicationController
  include Authenticatable
  
  before_action :current_user, only: [:create, :destroy]
  before_action :correct_user, only: :destroy

  def create
    @micropost = Microposts::Create.run!(params[:micropost].merge( user: current_user))
    redirect_to current_user, notice: "микропост cоздан и ожидает модерации"
  end

  def destroy
    @micropost.destroy
    redirect_to current_user || root_url, notice: "микропост был удален"
  end
  
  def show
    @micropost = Microposts::Find.run(params).result
  end

  private

  def correct_user
    @micropost = current_user.microposts.find_by(id: params[:id])
    redirect_to current_user if @micropost.nil?
  end
end