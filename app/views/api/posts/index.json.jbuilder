json.current_user_id current_user.id

json.posts @posts do |post|
  json.extract! post, :title, :content, :user_id, :id
end