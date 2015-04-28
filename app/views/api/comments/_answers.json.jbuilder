json.answers do
  json.count @comment.answers.count
  json.array! @comment.answers do |answer|
    json.answer answer.content
  end
end