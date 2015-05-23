class StockSell < ActiveRecord::Base
  after_save :decrease_current_stock
  belongs_to :stock_purchase

  def decrease_current_stock
    self.stock_purchase.current_amount -= self.amount
    self.stock_purchase.save
  end

  def total_sale_value
    self.amount * self.price
  end
end
