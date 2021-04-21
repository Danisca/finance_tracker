class StocksController < ApplicationController
  def search_stock
    if params[:stock].present?
      @stock =  Stock.lookup(params[:stock])  
      if @stock
        respond_to do |format|
          format.js { render partial: 'users/results_searching_stocks_js' }
        end
      else
        respond_to do |format|
          flash.now[:alert] =  "Please enter some valid symbol to look for"
          format.js { render partial: 'users/results_searching_stocks_js' }
        end
      end
    else
        respond_to do |format|
          flash.now[:alert] =  "Please enter something to look for"
          format.js { render partial: 'users/results_searching_stocks_js' }
        end
    end
  end
end
