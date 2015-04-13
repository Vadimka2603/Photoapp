ActiveAdmin.register Hashtag do
  actions :all, :except => [:show]

  index do
    column :name
    actions
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


