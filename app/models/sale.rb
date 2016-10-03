class Sale < ActiveRecord::Base
  belongs_to :customer
  belongs_to :vendor
  belongs_to :address

  scope :from_customer, lambda { |customer|
    joins(:customer).where("customer_id in (?)", customer.select(:id))
  }
end
