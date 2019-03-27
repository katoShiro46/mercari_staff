FactoryBot.define do
  factory :user do
    email                        {Faker::Internet.free_email}
    password                     { password }
    password_confirmation        { password }
    first_name                   { "鈴木" }
    last_name                    { "一郎" }
    first_name_kana              { "すずき" }
    last_name_kana               { "いちろう" }
    nickname                     { "イチロー" }
    tellphone                    {"09012345678"}
    profile                      {"初めまして"}
    icon                         {"aaa"}
    invitation_code              {"123456789"}
    birth_year                   {"1992"}
    birth_month                  {"3"}
    birth_day                    {"30"}
  end

  factory :vendor do
    email                        {Faker::Internet.free_email}
    password                     { password }
    password_confirmation        { password }
    first_name                   { "田中" }
    last_name                    { "太郎" }
    first_name_kana              { "たなか" }
    last_name_kana               { "たろう" }
    nickname                     { "田なっち" }
    phone_number                 { "07012345678" }
    profile                      { "こんにちは" }
    icon                         { "aaa" }
    invitation_code              { "12345678" }
    birth_year                   { "1992" }
    birth_month                  { "3" }
    birth_day                    { "30" }
  end
end
