class StockPurchasesController < ApplicationController
  def new
    @stock_purchase = StockPurchase.new
    @stocks = Stock.all
  end

  def create
    # binding.pry
    @stock_purchase = StockPurchase.new(stock_id: stock_purchase_params[:stock_id], user_id: current_user.id, price: stock_purchase_params[:price], original_amount: stock_purchase_params[:original_amount], current_amount: stock_purchase_params[:original_amount], date: stock_purchase_params[:date])
    if @stock_purchase.save
      redirect_to stock_purchases_path
    else
      render action: 'new'
    end
  end

  def show
    @stock_purchase = StockPurchase.find(params[:id])
    @stocks = Stock.all
  end

  def index
    @stock_purchases = StockPurchase.where(user_id: current_user.id)
  end


  private
  def stock_purchase_params
    params.require(:stock_purchase).permit(:stock_id,:price,:original_amount,:date)
  end
end
