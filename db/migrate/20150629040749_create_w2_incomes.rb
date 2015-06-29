class CreateW2Incomes < ActiveRecord::Migration
  def change
    create_table :w2_incomes do |t|
      t.string :company
      t.integer :amount
      t.belongs_to :user

      t.timestamps null: false
    end
  end
end
