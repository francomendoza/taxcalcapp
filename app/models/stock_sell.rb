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
    gross_income = GrossIncome.find_by(user_id: self.user_id, year: year)
    gross_income ||= GrossIncome.create(user_id: self.user_id, year: year, total: 0)
    
    gross_income.total += self.total_sale_value
    gross_income.save
  end
end
