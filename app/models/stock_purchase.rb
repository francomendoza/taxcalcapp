class StockPurchase < ActiveRecord::Base
  belongs_to :stock
  belongs_to :user
  has_many :stock_sells

  def current_total_value
    self.price*self.current_amount
  end

  
end
