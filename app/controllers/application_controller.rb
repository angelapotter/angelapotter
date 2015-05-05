class ApplicationController < ActionController::Base

  helper_method :body_css_class
  helper_method :portfolio_items

  def portfolio_items
    PortfolioItems.all
  end

  def body_css_class
    "#{ params[ :action ].gsub( '_', '-' ) } #{ params[ :controller ].gsub( '_', '-' ) }"
  end

end
