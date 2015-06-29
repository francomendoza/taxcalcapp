class W2IncomesController < ApplicationController
  def new
    @w2_income = W2Income.new
  end

  def create
    @w2_income = W2Income.new(user_id: current_user.id, company: w2_income_params[:company], amount: w2_income_params[:amount])
    if @w2_income.save
      redirect_to w2_incomes_path
    else
      render action: 'new'
    end
  end

  def index
    @w2_incomes = W2Income.where(user_id: current_user.id)
  end

  private
  def w2_income_params
    params.require(:w2_income).permit(:company,:amount)
  end
end
