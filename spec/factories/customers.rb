FactoryGirl.define do
  factory :customer, class: Customer do |f|
    f.name 'Marty McFly'
    f.association :sale, factory: :Sale, sale_id: 1
  end
end
