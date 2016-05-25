json.array!(@short_urls) do |short_url|
  json.extract! short_url, :id, :user_id, :url
  json.url short_url_url(short_url, format: :json)
end
