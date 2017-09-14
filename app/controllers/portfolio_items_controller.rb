class PortfolioItemsController < ApplicationController

  def show
    portfolio_items.each_with_index do |item, index|
      if item.slug == params[ :slug ]
        @item = item
        @index = index
        return
      end
    end

    redirect_to work_path
  end

end
