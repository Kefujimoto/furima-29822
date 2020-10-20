FactoryBot.define do
  factory :order_address do
    token {"tok_abcdefghijk00000000000000000"}
    area_id {2}
    post_number {'123-4567'}
    city_number {'帯広市'}
    house_number {'稲田町'}
    phone_number  {'09012345678'}
  end
end
