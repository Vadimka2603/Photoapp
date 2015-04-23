ActiveAdmin.register Micropost do
belongs_to :user,  optional: true

config.per_page = 5
actions :all, :except => [:destroy]
permit_params :ban_status

filter :user
filter :created_at

scope :all, :default => true
  scope :banned do |microposts|
    microposts.where(aasm_state: :banned)
  end
  scope :legal do |microposts|
    microposts.where(aasm_state: :uproved)
  end
  scope :moderating do |microposts|
    microposts.where(aasm_state: :moderating)
  end


index do
  column :user
  column "Фото" do |micropost|
    image_tag(micropost.picture_url)
  end
  column :content
  actions
  column :aasm_state
  column "Модерация" do |micropost|
    if micropost.banned?
    else
      link_to('Забанить', ban_admin_micropost_path(micropost))
    end  
  end
  column "Модерация" do |micropost|
    if micropost.uproved?
    else
      link_to('Разрешить', uprove_admin_micropost_path(micropost))
    end
  end
end

member_action :ban do
  micropost = Micropost.find params[:id]
  micropost.ban!
  redirect_to admin_microposts_path, :notice => "микропост забанен"
end

member_action :uprove do
  micropost = Micropost.find params[:id]
  micropost.uprove!
  redirect_to admin_microposts_path, :notice => "микропост разрешен"
end

show :title => "Фото" do
  link_to image_tag(micropost.picture_url)
end

sidebar "Данные", :only => :show do
  attributes_table_for micropost do
  	row :id
    row :user 
    row :content
    row :created_at
    row :aasm_state
  end
end

end
