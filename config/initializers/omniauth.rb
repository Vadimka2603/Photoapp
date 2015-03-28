OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook,  ENV["FACEBOOK_APP_ID"], ENV["FACEBOOK_SECRET"]
           
  provider :vkontakte, ENV["VK_APP_ID"], ENV["VK_SECRET"]
end