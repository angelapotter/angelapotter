class PortfolioItemsController < ApplicationController

  def show
    portfolio_items.each_with_index do |item, index|
      if item.slug == params[ :slug ]
        @portfolio_item = item
        @next_portfolio_item = portfolio_items[ index + 1 ]
        @prev_portfolio_item = if index > 0
          portfolio_items[ index - 1 ]
        else
          nil
        end
        return
      end
    end
  end

end
