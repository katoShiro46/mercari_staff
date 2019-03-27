FactoryBot.define do
  factory :item do
    name                    { "スニーカー" }
    description             { "新作です" }
    price                   { "6000" }
    condition               { "fresh" }
    shipping_fee            { "buyer" }
    shipping_date           { "within_2days" }
    prefecture_id           { "1" }
    shipping_method         { "undecided" }
    size_id                 { "1" }
    category_id             { "500" }
    brand                   { "ナイキ" }
    vendor_id               { "1"}
    user_id                 { "2" }
  end
end
