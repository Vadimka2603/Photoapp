class MicropostCreate < Mutations::Command

  required do
    string :content, max_length: 70
    
  end

  def execute
  	
    @micropost = Micropost.create!(:picture)
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

