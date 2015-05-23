class CreateStockSells < ActiveRecord::Migration
  def change
    create_table :stock_sells do |t|
      t.belongs_to :stock_purchase, index: true, foreign_key: true
      t.integer :price
      t.integer :amount
      t.datetime :date

      t.timestamps null: false
    end
  end
end
