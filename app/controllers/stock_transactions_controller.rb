class StockTransactionsController < ApplicationController
  def new
    @stock_transaction = StockTransaction.new
    @stocks = Stock.all
  end

  def create
    # binding.pry
    @stock_transaction = StockTransaction.new(stock_transaction_params)
    if @stock_transaction.save
      redirect_to stock_transactions_path
    else
      render action: 'new'
    end
  end

  def show
    @stock_transaction = StockTransaction.find(params[:id])
    @stocks = Stock.all
  end

  def index
    @stock_transactions = StockTransaction.all
  end


  private
  def stock_transaction_params
    params.require(:stock_transaction).permit(:stock_id,:user_id,:price,:type_of,:date)
  end
end
