json.array! @users do |user|
  json.user_data do
    json.id user.id
    json.name user.name
    json.avatar user.avatar.url
    json.registration user.created_at
  end

  json.user_activity do
    json.microposts user.microposts_count
    json.likes user.likes_count
    json.comments user.comments_count
  end
end