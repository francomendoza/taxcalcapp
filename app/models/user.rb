class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :w2_incomes
  has_many :stock_purchases
  has_many :stock_sells

  after_save :aggregators_initializer

  def aggregators_initializer
    GrossIncome.create(user_id: self.id, total: 0, year: Date.today.year)
  end
end
