json.micropost do
  json.id @micropost.id
  json.user @micropost.user.name
  json.picture @micropost.picture.url
  json.content @micropost.content
  json.time @micropost.created_at
  json.ban_status @micropost.ban_status
  json.likes @micropost.likes_count
  json.comments @micropost.comments_count
end