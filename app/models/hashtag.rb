class Hashtag < ActiveRecord::Base
  after_create :create_subscription

  def create_subscription
  	Instagram.create_subscription(object: 'tag', 
  	                              callback_url: 'https://shrouded-garden-5776.herokuapp.com/instagram/callback', 
  	                              object_id: self.name)
  end
end
