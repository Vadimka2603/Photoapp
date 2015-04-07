ActiveAdmin.register User do
	
  config.per_page = 20

  actions :index, :show

  index do
    column :id
    column "Avatar" do |user|
      link_to image_tag(user.avatar_url)
    end
    column :name
    column :provider
    column "Number of photos" do |user|
      user.microposts.count
    end
    column "Show user micrposts", only: [:show, :edit] do |user|
      link_to "Microposts", admin_user_microposts_path(user)
    end
  end
 
  show do
    attributes_table_for user do
  	  row :id
      row "Avatar" do |user|
        link_to image_tag(user.avatar_url)
      end
      row :name
      row :provider
      row "Show user micrposts", only: [:show, :edit] do |user|
        link_to "Microposts", admin_user_microposts_path(user)
      end
    end
  end
end
