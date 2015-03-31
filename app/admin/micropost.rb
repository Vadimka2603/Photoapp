ActiveAdmin.register Micropost do
config.per_page = 5
actions :all, :except => [:destroy]
permit_params :ban_status

scope :all, :default => true
  scope :banned do |microposts|
    microposts.where(:ban_status => true)
  end
  scope :legal do |microposts|
    microposts.where(:ban_status => false)
  end

 index do
  column :user
  column "Фото" do |micropost|
  link_to image_tag(micropost.picture_url), admin_micropost_path(micropost)
  end
  column :content
  actions
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
    row :ban_status
  end
end

  form do |f|
  	div :class => "form" do 
    f.inputs 'Забанить' do
    f.input :ban_status
    end
  f.actions
  end
end
end
