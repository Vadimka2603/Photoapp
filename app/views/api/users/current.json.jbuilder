json.user_data do
  json.id current_user.id
  json.name current_user.name
  json.avatar current_user.avatar.url
  json.registration current_user.created_at
  json.provider current_user.provider
end

json.user_activity do
  json.microposts user.microposts_count
  json.likes user.likes_count
  json.comments user.comments_count
end