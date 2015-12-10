json.array!(@entries) do |entry|
  json.extract! entry, :id, :posting_id, :published, :link, :title, :content, :author_id
  json.url entry_url(entry, format: :json)
end
