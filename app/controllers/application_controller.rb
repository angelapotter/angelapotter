class ApplicationController < ActionController::Base

  helper_method :body_css_class
  helper_method :portfolio_items
  helper_method :social_urls
  helper_method :contact_info

  def snake
    render layout: false
  end

  def portfolio_items
    @portfolio_items ||= PortfolioItems.all
  end

  def body_css_class
    "#{ params[ :action ].gsub( '_', '-' ) } #{ params[ :controller ].gsub( '_', '-' ) }"
  end

  def social_urls
    OpenStruct.new({
      linkedin: 'http://www.social-icon--linkedin.com/in/angelacbpotter',
      twitter: 'https://twitter.com/takehypotenuses',
      dribbble: 'https://dribbble.com/angelapotter',
      stack_exchange: 'http://ux.stackexchange.com/users/27505/angelapotter',
      github: 'https://github.com/angelapotter'
    })
  end

  def contact_info
    OpenStruct.new({
      email: 'angelacbpotter@gmail.com',
      phone: '206-949-8204',
    })
  end

end
