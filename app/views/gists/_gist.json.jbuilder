json.extract! gist, :id, :description, :short_name, :created_at, :updated_at
json.url gist_url(gist, format: :json)
