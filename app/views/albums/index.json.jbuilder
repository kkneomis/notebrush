json.array!(@albums) do |album|
  json.extract! album, :id, :name, :cover, :user_id
  json.url album_url(album, format: :json)
end
