json.array! @all_items do |micropost|
  json.micropost do
    json.id micropost.id
    json.user micropost.user.name
    json.picture micropost.picture.url
    json.content micropost.content
    json.likes micropost.likes_count
  end
end