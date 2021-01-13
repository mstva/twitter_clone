json.array! @users do |user|
  json.user_id user.id
  json.name user.name
  json.username user.username
  json.email user.email
  json.twits user.twits do |twit|
    json.twit_id twit.id
    json.body twit.body
    json.created_at twit.created_at
    json.updated_at twit.updated_at
    json.twit_url twit_url(twit, format: :json)
  end
end