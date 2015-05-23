class User < ActiveRecord::Base
  has_many :stock_transactions
  has_many :stock_purchases
end
