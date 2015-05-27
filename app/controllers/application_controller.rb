class ApplicationController < ActionController::Base

  helper_method :body_css_class
  helper_method :portfolio_items

  def snake
    render layout: false
  end

  def portfolio_items
    @portfolio_items ||= PortfolioItems.all
  end

  def body_css_class
    "#{ params[ :action ].gsub( '_', '-' ) } #{ params[ :controller ].gsub( '_', '-' ) }"
  end

end
