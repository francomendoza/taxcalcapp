class StockSell < ActiveRecord::Base
  after_save :decrease_current_stock, :add_to_gross_income
  belongs_to :stock_purchase

  def decrease_current_stock
    self.stock_purchase.current_amount -= self.amount
    self.stock_purchase.save
  end

  def total_sale_value
    self.amount * self.price
  end

  def add_to_gross_income
    #find user and year gross income
    year = self.date.year
    gross_income = GrossIncome.find_by_or_create(user_id: current_user.id, year: year)
    self.total_sale_value
  end
end
