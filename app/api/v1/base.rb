module V1
  class Base < Grape::API
    mount V1::Courses
    mount V1::PurchaseRecords
  end
end

