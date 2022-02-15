json.extract! flight, :id, :number, :origin, :destination, :date, :created_at, :updated_at, :plane_id, :reservations
json.extract! flight.plane, :name, :rows, :cols
json.url flight_url(flight, format: :json)