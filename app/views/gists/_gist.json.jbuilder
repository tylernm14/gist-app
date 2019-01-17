json.extract! gist, :id, :description, :short_url, :created_at, :updated_at
json.url gist_url(gist, format: :json)
