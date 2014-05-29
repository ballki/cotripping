json.array!(@trips) do |trip|
  json.extract! trip, :user_id, :destination, :start, :end, :certainty
  json.url trip_url(trip, format: :json)
end