FactoryBot.define do
  factory :donation do
    name                           { 'speaker' }
    description                    { '1年間部屋に眠っていた商品です。' }
    category_id                    { 2 }
    condition_id                   { 2 }
    delivery_id                    { 2 }
    region_id                      { 2 }
    ship_id                        { 2 }
    size_id                        { 2 }
   

    after(:build) do |miniroom|
      miniroom.image.attach(io: File.open('public/images/simple.jpeg'), filename: 'simple.jpeg')
    end
    
    association :user
  end
end
