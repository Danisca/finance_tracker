class WelcomeController < ApplicationController
  def index
    @stocks = current_user.stocks
  end
end
