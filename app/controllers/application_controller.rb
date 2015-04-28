class ApplicationController < ActionController::Base
  include Authenticatable
  
  protect_from_forgery with: :exception
  skip_before_filter :verify_authenticity_token

end

