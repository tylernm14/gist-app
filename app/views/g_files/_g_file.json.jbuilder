json.extract! g_file, :id, :filename, :contents, :gist_id, :created_at, :updated_at
json.url g_file_url(g_file, format: :json)
