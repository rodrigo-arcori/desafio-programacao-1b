module HomeHelper
  def sum(sales)
    amount = 0
    sales.each do |v| amount += v.price end
    amount
  end
end
