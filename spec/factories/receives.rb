FactoryBot.define do
  factory :receive do
      post_code { '123-4567' }
      region_id { 2 }
      city { '東京都' }
      address { '1-1' }
      phone_num {'07011223344'}
    end
  end
