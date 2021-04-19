class Stock < ApplicationRecord
  TOKEN = Rails.application.credentials.iex_api[:token]
  SECRET = Rails.application.credentials.iex_api[:secret]
  END_POINT = 'https://sandbox.iexapis.com/v1'
  def self.lookup(ticker_symbol)
    client = IEX::Api::Client.new(
      publishable_token: TOKEN,
      secret_token: SECRET,
      endpoint: END_POINT
    )
    client.price(ticker_symbol)
  end
end
