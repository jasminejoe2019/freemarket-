FactoryBot.define do

  factory :user do
    nickname              {"abe"}
    email                 {"kkk@gmail.com"}
    password              {"0000000"}
    password_confirmation {"0000000"}
    first_name            {"岳士"}
    first_furigana        {"タケシ"}
    family_name           {"本田"}
    family_furigana       {"ホンダ"}
    birthday              {"19790924"}
    telephone             {"09056464071"}
    profile               {"aaaaaa"}
    sales                 {10000}
    mobile                {"09056464071"}
  end

end