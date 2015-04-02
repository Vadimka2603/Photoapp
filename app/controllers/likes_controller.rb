class LikesController < ApplicationController

  
  def create
    # Grab our book from the DB. Note that this syntax is for Rails 3.2 and below. Rails 4 uses something called Strong Parameters, but that is for another time. 
    micropost = Micropost.find(params[:micropost_id])
    # Create a like
    Like.create(:micropost => micropost, :user => current_user)
    # redirect back to the Like index page and assign a flash
    redirect_to likes_path, :notice => "You just liked the micropost #{micropost.content}" 
  end

  # here is where we will destroy a Like
  # DELETE /likes/:id
  def destroy
    # Get the like form the DB
    like = Like.find(params[:id])
    # destroy it
    like.destroy
    redirect_to likes_path, :notice => "You destroyed a like"
  end
end