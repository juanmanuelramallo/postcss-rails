json.extract! libro, :id, :nombre, :editorial, :portada, :año_publicación, :created_at, :updated_at
json.url libro_url(libro, format: :json)