json.user do
  json.set! :id, @user.id
  json.set! :name, @user.name
  json.set! :email, @user.email
  json.set! :steps, @user.steps
  json.set! :friend_ids, @user.friends.map { |friend| friend.id }
  json.set! :created_at, @user.created_at
  json.set! :updated_at, @user.updated_at
end
