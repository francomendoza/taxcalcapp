class GrossIncomesController < ApplicationController
  def index
    @gross_incomes = GrossIncome.where(user_id: current_user.id)
  end
end
