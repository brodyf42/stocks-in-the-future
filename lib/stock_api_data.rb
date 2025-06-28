class StockApiData
  def initialize(symbol:)
    @symbol = symbol
  end

  def name = overview.name

  def description = overview.description

  def website = overview.official_site

  def industry = overview.industry

  def exchange = overview.exchange

  def profit_margin = overview.profit_margin

  def cash_flow = cash_flow_data&.first&.operating_cashflow

  def price = quote.price

  private

  # The methods on the top-level Alphavantage classes make separate API requests
  # Memoizing those method return values will minimize total requests made

  def overview
    @overview ||= fundamental_data.overview
  end

  def cash_flow_data
    @cash_flow ||= fundamental_data.cash_flow
  end

  def quote
    @qquote ||= timeseries.quote
  end

  def fundamental_data
    @fundamental_data ||= Alphavantage::Fundamental.new(symbol: @symbol)
  end

  def timeseries
    @timeseries ||= Alphavantage::TimeSeries.new(symbol: @symbol)
  end
end
