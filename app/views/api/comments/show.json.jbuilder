json.comment do
  json.id @comment.id
  json.user @comment.user.name
  json.content @comment.content
  json.partial! 'api/comments/answers'  
end