json.array!(@entries) do |entry|
  json.extract! entry, :id, :title, :description, :user_id, :tag, :reel
  json.url entry_url(entry, format: :json)
end
