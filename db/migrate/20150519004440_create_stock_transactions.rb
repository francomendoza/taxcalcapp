class CreateStockTransactions < ActiveRecord::Migration
  def change
    create_table :stock_transactions do |t|
      t.belongs_to :stock, index: true, foreign_key: true
      t.belongs_to :user, index: true, foreign_key: true
      t.integer :price
      t.string :type_of
      t.datetime :date

      t.timestamps null: false
    end
  end
end
