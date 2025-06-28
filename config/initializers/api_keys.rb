Alphavantage.configure do |config|
  config.api_key = ENV.fetch("STOCKS_API_KEY", "test-api-key")
end
