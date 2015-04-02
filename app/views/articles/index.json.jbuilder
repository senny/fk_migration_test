json.array!(@articles) do |article|
  json.extract! article, :id, :author_id, :title
  json.url article_url(article, format: :json)
end
