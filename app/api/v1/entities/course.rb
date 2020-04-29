module V1
  module Entities
    class Course < Grape::Entity
      expose :user_id
      expose :theme
      expose :price
      expose :currency
      expose :course_type
      expose :available
      expose :url
      expose :description
      expose :start_at
      expose :expire_days
      expose :created_at
      expose :updated_at
    end
  end
end
