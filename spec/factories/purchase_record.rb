FactoryBot.define do
  factory :purchase_record do
    user
    course
    payment_method { 'credit_card' }
    amount { 100 }
    paid { false }
    currency { 'NTD' }
  end
end

