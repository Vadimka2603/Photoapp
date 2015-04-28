module Likes
  class Find < ActiveInteraction::Base
    integer :id

    def execute
      like = Like.find_by_id(id)
      if like
        like
      else
        raise 'like does not exist'
      end
    end
  end
end