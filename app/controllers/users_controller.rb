class UsersController < ApplicationController
  def my_portfolio
    @stocks = current_user.stocks
  end

  def show
    @friend = User.find_by(id: params[:id])
    render 'profile'
  end

  def my_friends
    @friends = current_user.friends
  end
end
