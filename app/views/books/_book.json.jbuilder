json.extract! book, :id, :title, :description, :authentication, :created_at, :updated_at
json.url book_url(book, format: :json)