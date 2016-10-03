FactoryGirl.define do
  factory :address, class: Address do |f|
    f.name '123 Fake St'
    f.association :customer
  end
end
