class StocksController < ApplicationController
  def new
    @stock = Stock.new
  end

  def create
    @stock = Stock.new(stock_params)
    if @stock.save
      redirect_to @stock
    else
      render action: 'new'
    end
  end

  def show
    @stock = Stock.find(params[:id])
  end

  def index
    @stocks = Stock.all
  end


  private
  def stock_params
    params.require(:stock).permit(:symbol)
  end
end
