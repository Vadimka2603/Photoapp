module Microposts
  class Find < ActiveInteraction::Base
    integer :id

    def execute
      micropost = Micropost.find_by_id(id)
      if micropost
        micropost
      else
        raise 'micropost does not exist'
      end
    end
  end
end