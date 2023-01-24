FactoryBot.define do
  factory :miniroom do
    title {Faker::Lorem.sentence}
    concept {Faker::Lorem.sentence}

    after(:build) do |miniroom|
      miniroom.image.attach(io: File.open('public/images/simple.jpeg'), filename: 'simple.jpeg')
    end

    association :user
  end
end
