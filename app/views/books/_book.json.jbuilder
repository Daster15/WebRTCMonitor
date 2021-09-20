json.extract! book, :id, :name, :author, :category, :price, :created_at, :updated_at
json.url book_url(book, format: :json)
