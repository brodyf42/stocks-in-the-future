# frozen_string_literal: true

class StockPricesUpdateJob < ApplicationJob
  queue_as :default

  def perform(...)
    Stock::SYMBOLS.each do |symbol|
      api_data = StockApiData.new(symbol: symbol)
      stock = Stock.find_or_initialize_by(ticker: symbol)

      stock.update(
        stock_exchange: api_data.exchange,
        company_name: api_data.name,
        company_website: api_data.website,
        description: api_data.description,
        industry: api_data.industry,
        # management: ,
        # employees: ,
        # competitor_names: ,
        # sales_growth: ,
        # industry_avg_sales_growth: ,
        # debt_to_equity: ,
        # industry_avg_debt_to_equity: ,
        profit_margin: api_data.profit_margin,
        # industry_avg_profit_margin: ,
        cash_flow: api_data.cash_flow,
        # debt: ,
        price_cents: api_data.price * 100
      )
    end
  end
end
