json.extract! twit, :id, :body, :created_at, :updated_at
json.url twit_url(twit, format: :json)
