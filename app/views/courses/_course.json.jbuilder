json.extract! course, :id, :user_id, :theme, :price, :currency, :course_type, :available, :url, :description, :start_at, :expire_days, :created_at, :updated_at
json.url course_url(course, format: :json)
