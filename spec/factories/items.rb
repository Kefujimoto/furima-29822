FactoryBot.define do
  factory :item do
    image             {File.open("public/images/item_image.png")}
    name              {Faker::Name.name}
    explain           {sampleexplain}
    category_id       {2}
    status_id         {3}
    charge_id         {4}
    area_id           {2}
    days_id           {5}
    price             {500}
    association :user

  end
end