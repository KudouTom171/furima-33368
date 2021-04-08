FactoryBot.define do
  factory :item do
    item_name         {'test'}
    item_detail       {'2'}
    category_id       {'2'}
    status_id         {'2'}
    shipping_fee_id   {'2'}
    prefecture_id     {'2'}
    lead_time_id      {'2'}
    price             {'1000'}
    association :user, factory: :user
    after(:build) do |item|
      item.image.attach(io: File.open('spec/fixtures/test_image.png'), filename: 'test_image.png', content_type: 'image/png')
    end
  end
end