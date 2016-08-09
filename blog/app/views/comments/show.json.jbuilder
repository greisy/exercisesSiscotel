
json.id @comment.id
json.user_id @comment.user.id
json.article_id @comment.article.id
json.body @comment.body
json.created_at @comment.created_at
json.updated_at @comment.updated_at
json.user do
	json.email @comment.user.email
end