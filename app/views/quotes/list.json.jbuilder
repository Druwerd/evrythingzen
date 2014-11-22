json.array!(@quotes) do |quote|
  json.extract! quote, :id, :text, :source, :source_link, :zen_link
  json.url quote_url(quote, format: :json)
end
