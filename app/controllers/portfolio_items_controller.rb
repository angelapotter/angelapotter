class PortfolioItemsController < ApplicationController

  helper_method :prev_portfolio_item
  helper_method :next_portfolio_item
  helper_method :prev_portfolio_item_path
  helper_method :next_portfolio_item_path

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

  def prev_portfolio_item
    @portfolio_items[ @index - 1 ]
  end

  def next_portfolio_item
    @portfolio_items[ @index + 1 ]
  end

  def prev_portfolio_item_path
    if prev_portfolio_item.present?
      portfolio_items_path( prev_portfolio_item.slug )
    else
      '#'
    end
  end

  def next_portfolio_item_path
    if next_portfolio_item.present?
      portfolio_items_path( next_portfolio_item.slug )
    else
      '#'
    end
  end

end
