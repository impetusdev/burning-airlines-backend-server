json.extract! reservation, :id, :seat, :created_at, :updated_at, :user_id, :flight_id
json.url reservation_url(reservation, format: :json)