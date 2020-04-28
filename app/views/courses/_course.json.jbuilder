json.extract! course, :id, :theme, :price, :currency, :type, :available, :url, :description, :end_at, :created_at, :updated_at
json.url course_url(course, format: :json)
