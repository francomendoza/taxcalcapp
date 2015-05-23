class CreateStockPurchases < ActiveRecord::Migration
  def change
    create_table :stock_purchases do |t|
      t.belongs_to :stock, index: true, foreign_key: true
      t.belongs_to :user, index: true, foreign_key: true
      t.integer :price
      t.integer :original_amount
      t.integer :current_amount
      t.datetime :date

      t.timestamps null: false
    end
  end
end
