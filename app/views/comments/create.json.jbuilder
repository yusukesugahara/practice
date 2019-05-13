json.nickname  @comment.user.nickname
json.text  simple_format(@comment.text)
json.diary_id  @comment.diary_id
json.comment_id  @comment.id
json.image_url @comment.user.image.url
