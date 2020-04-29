FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "user#{n}" + Time.now.strftime('%T').delete(':') + '@factory.com' }
    password_digest { 'test' }
    admin { false }
  end
end

