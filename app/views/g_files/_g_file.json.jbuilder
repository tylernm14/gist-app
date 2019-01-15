json.extract! g_file, :id, :name, :contents, :references, :created_at, :updated_at
json.url g_file_url(g_file, format: :json)
