ActiveAdmin.register Micropost do
  belongs_to :user,  optional: true

  config.per_page = 5
  actions :all, except: [:new, :create, :destroy]
  permit_params :ban_status

  filter :user
  filter :created_at

  scope :all, :default => true
  scope :banned 
  scope :approved
  scope :moderating

  index do
    column :user
    column "Фото" do |micropost|
      image_tag(micropost.picture_url)
    end
    column :content
    column :aasm_state
    column "Модерация" do |micropost|
      link_to('Забанить', ban_admin_micropost_path(micropost)) unless micropost.banned?
    end
    column "Модерация" do |micropost|
      link_to('Разрешить', approve_admin_micropost_path(micropost)) unless micropost.approved?
    end
  end

  member_action :ban do
    micropost = Micropost.find params[:id]
    micropost.ban!
    redirect_to admin_microposts_path, notice: "микропост забанен"
  end

  member_action :approve do
    micropost = Micropost.find params[:id]
    micropost.approve!
    redirect_to admin_microposts_path, notice: "микропост разрешен"
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
