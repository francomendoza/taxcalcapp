class CreateGrossIncomes < ActiveRecord::Migration
  def change
    create_table :gross_incomes do |t|
      t.integer :total
      t.belongs_to :user, index: true, foreign_key: true
      t.integer :year

      t.timestamps null: false
    end
  end
end
