json.micropost do
  json.id @micropost.id
  json.user do
    json.extract! @micropost.user, :name, :id, :microposts_count
  end
  json.picture @micropost.picture.url
  json.content @micropost.content
  json.time @micropost.created_at
  json.likes @micropost.likes_count
  json.comments @micropost.comments_count
end