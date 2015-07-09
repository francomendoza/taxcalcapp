class W2Income < ActiveRecord::Base
  belongs_to :user
  after_save :add_to_gross_income

  def add_to_gross_income
    
  end
end
