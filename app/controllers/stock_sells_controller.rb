class StockSellsController < ApplicationController
  def new
    @stock_sell = StockSell.new
    @stock_purchase = StockPurchase.find(params[:stock_purchase_id])
  end

  def create
    @stock_sell = StockSell.new(stock_purchase_id: stock_sell_params[:stock_purchase_id], price: stock_sell_params[:price], amount: stock_sell_params[:amount], date: stock_sell_params[:date], user_id: current_user.id)
    if @stock_sell.save
      redirect_to stock_purchases_path
    else
      render action: 'new'
    end
  end

  def full_index
    @stock_sells = StockSell.joins(:stock_purchase).where("stock_purchases.user_id = #{current_user.id}")
    render 'index'
  end

  def index
    @stock_sells = StockPurchase.find(params[:stock_purchase_id]).stock_sells
  end

  private
  def stock_sell_params
    params.require(:stock_sell).permit(:price, :amount, :date, :stock_purchase_id)
  end
end
