ActiveAdmin.register Micropost do
belongs_to :user,  optional: true

config.per_page = 5
actions :all, :except => [:destroy]
permit_params :ban_status

filter :user
filter :created_at

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
    image_tag(micropost.picture_url)
  end
  column :content
  actions
  column :ban_status
  column "Бан" do |micropost|
    link_to('Изменить статус бана', ban_admin_micropost_path(micropost))
  end
end

member_action :ban do
  micropost = Micropost.find params[:id]
    if micropost.ban_status?
      micropost.update_attribute(:ban_status, false)
      redirect_to admin_microposts_path
    else
      micropost.update_attribute(:ban_status, true)
      redirect_to admin_microposts_path
    end
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
