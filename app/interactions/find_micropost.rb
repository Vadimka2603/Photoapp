class FindMicropost < ActiveInteraction::Base
  integer :id

  def execute
    micropost = Micropost.find_by_id(id)

    if micropost
      micropost
    else
      errors.add(:id, 'does not exist')
    end
  end
end