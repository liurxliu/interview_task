FactoryBot.define do
  factory :course do
    user
    theme { 'Test' }
    price { 11 }
    currency { 'NTD' }
    course_type { 'test' }
    available { true }
    url { 'test' }
    description { 'test' }
    start_at { Time.now }
    expire_days { 10 }
  end
end

