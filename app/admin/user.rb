ActiveAdmin.register User do
	config.per_page = 20
actions :index
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
  end

end
