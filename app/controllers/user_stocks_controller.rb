class UserStocksController < ApplicationController
  def create
    stock = Stock.check_db(params[:ticker])
    if stock.blank?
      stock =  Stock.lookup(params[:ticker])
      stock.save
    end
    user_stock = UserStock.create(user: current_user, stock: stock)
    flash[:notice] = "Stock #{stock.name} successfully added to your portfolio"
    redirect_to my_portfolio_path
  end

 def destroy
   UserStock.find_by(stock_id: params[:id],user_id: current_user.id).destroy
   flash[:notice] = "Stock successfully removed from your portfolio"
   redirect_to my_portfolio_path
 end
  

end
