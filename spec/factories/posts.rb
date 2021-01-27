FactoryBot.define do
  factory :post do
    text { Faker::Lorem.sentence }
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/people.jpg'), filename: 'people.jpg')
    end
  end
end
