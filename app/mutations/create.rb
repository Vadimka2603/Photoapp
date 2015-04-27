class MicropostCreate < Mutations::Command

  required do
    string :content, max_length: 70
    model  :user
  end

  def execute
    @micropost = Micropost.create!(:picture, user: current_user)
    if @micropost.save
      flash[:success] = "Photo added!"
      redirect_to current_user
    else
      @feed_items = []
      redirect_to current_user
    end
      @micropost
  end

end

