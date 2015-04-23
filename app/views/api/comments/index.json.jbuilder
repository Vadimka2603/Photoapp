json.array! @comment do |comment|
  json.comment do
    json.id comment.id
    json.user do
      json.name comment.user.name
      json.id   comment.user.id
      json.comments comment.user.comments_count
    end
    json.micropost do
      json.id  comment.micropost.id
      json.picture comment.micropost.picture
      json.content comment.micropost.content
    end   
    json.content comment.content
    json.answers do
      json.answers_count comment.answers.count
      json.array! comment.answers do |answer|
        json.content answer.content
      end
    end
  end
end