ActiveAdmin.register User do
	
  config.per_page = 20

  actions :index, :show

  index do
    column :id
    column "Avatar" do |user|
      link_to image_tag(user.avatar_url)
    end
    column "name" do |user|
      link_to user.name, admin_user_path(user)
    end
    column :provider
    column "Number of photos" do |user|
      user.microposts.count
    end
    column "Show user micrposts" do |user|
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
      row "Show user micrposts" do |user|
        link_to "Microposts", admin_user_microposts_path(user)
      end
    end
  end
end
