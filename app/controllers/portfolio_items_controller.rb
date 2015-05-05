class PortfolioItemsController < ApplicationController

  def show
    PortfolioItems.all.each do |item|
      if item.slug == params[ :slug ]
        @portfolio_item = item
        return
      end
    end
  end

end
