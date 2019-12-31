FactoryBot.define do
  factory :payment do
    credit_card_number  {"111111111111"}
    expiration_date     {"2020/12/31"}
    security_code       {"111"}
  end
end
