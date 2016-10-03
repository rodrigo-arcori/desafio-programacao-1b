FactoryGirl.define do
  factory :sale, class: Sale do |f|
    f.description 'R$10 off R$20 of food'
    f.price 10.0
    f.amount 90
  end
end
