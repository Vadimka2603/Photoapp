class InstagramsController < ApplicationController

def show
    default_search = Instagram.tag_search('Rockiesbaseball')
    if params[:q].blank?
      @tag = default_search
    else
      @tag = Instagram.tag_search(params[:q])
    end
    @tag = @tag.first.name
    @results = Instagram.tag_recent_media(@tag, {:count =>10} )
  end
end

def create_subscription(*args)
        options = args.last.is_a?(Hash) ? args.pop : {}
        object = args.shift
        callback_url = args.shift
        aspect = args.shift
        options.tap {|o|
          o[:object] = object unless object.nil?
          o[:callback_url] = callback_url unless callback_url.nil?
          o[:aspect] = aspect || o[:aspect] || "media"
        }
        response = post("subscriptions", options.merge(:client_secret => "442ae4c80b53406e84fd6d4bb6302665"))
        response
  end

  