json.array! @comments do |comment|
  json.comment do
    json.id comment.id
    json.user comment.user.name
    json.micropost do
      json.id  comment.micropost.id
      json.picture comment.micropost.picture
      json.content comment.micropost.content
    end   
    json.content comment.content
    json.answers_count comment.answers.count
  end
end