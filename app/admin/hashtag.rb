ActiveAdmin.register Hashtag do
  actions :all, :except => [:show]

  index do
    column :name
    actions
    column "Подписка" do |hashtag|
      link_to('Подписаться', subscribe_admin_hashtag_path(hashtag))
    end 
  end

  member_action :subscribe do
    begin
      hashtag = Hashtag.find params[:id]
      Instagram.create_subscription(object: 'tag', 
                                    callback_url: 'https://shrouded-garden-5776.herokuapp.com/instagram/callback', 
                                    object_id: hashtag.name)
      redirect_to admin_hashtags_path, :notice => "успешная подписка"
    rescue Instagram::BadRequest
      redirect_to admin_hashtags_path, :notice => "неудача"
    end  
  end

  form do |f|
    f.inputs 'Создать' do
    f.input :name
    end
    f.actions
  end

  controller do
    def permitted_params
      params.permit!
    end
  end
end


