class GrossIncomesController < ApplicationController
  def index
    @gross_income = GrossIncome.where(user_id: current_user.id)
  end
end
