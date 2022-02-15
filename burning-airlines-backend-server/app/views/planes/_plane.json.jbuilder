json.extract! plane, :id, :name, :rows, :cols, :created_at, :updated_at, :flights
json.url plane_url(plane, format: :json)