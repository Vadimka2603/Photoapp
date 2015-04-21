json.micropost do
  json.id @micropost.id
  json.user do
    json.name @micropost.user.name
    json.id   @micropost.user.id
    json.microposts @micropost.user.microposts_count
  end
  json.picture @micropost.picture.url
  json.content @micropost.content
  json.time @micropost.created_at
  json.likes @micropost.likes_count
  json.comments @micropost.comments_count
end