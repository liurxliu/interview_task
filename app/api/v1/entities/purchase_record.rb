module V1
  module Entities
    class PurchaseRecord < Grape::Entity
      expose :user_id
      expose :course_id
      expose :payment_method
      expose :amount
      expose :currency
      expose :paid
      expose :created_at
      expose :updated_at
    end
  end
end
