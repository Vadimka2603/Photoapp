json.comment do
  json.id @comment.id
  json.user @comment.user.name
  json.content @comment.content
  json.comments @comment.answers_count
end