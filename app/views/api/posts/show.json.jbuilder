json.posts @posts do |post|
  json.extract! post, :title, :content, :user_id, :id
end

# json.current_user_id current_user.id
# json.title   @post.title
# json.content @post.content