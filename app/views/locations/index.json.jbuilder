json.array!(@locations) do |location|
  json.extract! location, :id, :LocName
  json.url location_url(location, format: :json)
end
