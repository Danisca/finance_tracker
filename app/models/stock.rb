class Stock < ApplicationRecord

  has_many :user_stocks
  has_many :users, through: :user_stocks

  validates :name, :ticker_symbol, presence: true
  validates :name,:ticker_symbol, uniqueness: true

  TOKEN = Rails.application.credentials.iex_api[:token]
  SECRET = Rails.application.credentials.iex_api[:secret]
  END_POINT = 'https://sandbox.iexapis.com/v1'

  def self.lookup(ticker_symbol)
    client = IEX::Api::Client.new(
      publishable_token: TOKEN,
      secret_token: SECRET,
      endpoint: END_POINT
    )
    begin
      new(ticker_symbol: ticker_symbol,name: client.company(ticker_symbol).company_name, price: client.price(ticker_symbol))
    rescue => exception
      return nil
    end
  end

  def self.check_db(ticker_symbol)
    find_by ticker_symbol:  ticker_symbol
  end

end
