json.array!(@users) do |user|
  json.extract! user, :id, :username, :email, :telephone, :colour, :picture
  json.url user_url(user, format: :json)
end
