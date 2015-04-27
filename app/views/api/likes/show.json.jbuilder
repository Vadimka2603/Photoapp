json.like do
  json.user do
    json.name @like.user.name
    json.id   @like.user.id
    json.liked_posts @like.user.likes_count
  end
  json.micropost do
    json.micropost @like.micropost_id
    json.picture   @like.micropost.picture.url
    json.content   @like.micropost.content
    json.likes_get @like.micropost.likes_count
  end
end