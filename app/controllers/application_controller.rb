class ApplicationController < ActionController::Base

  helper_method :body_css_class
  helper_method :portfolio_items
  helper_method :social_urls
  helper_method :contact_info
  helper_method :current_job

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
      linkedin: 'http://www.linkedin.com/in/angelacbpotter',
      twitter: 'https://twitter.com/takehypotenuses',
      dribbble: 'https://dribbble.com/angelapotter',
      behance: 'https://www.behance.net/angelapotter',
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

  def current_job
    OpenStruct.new({
      position: 'Senior Product Designer',
      company: 'DoubleDutch',
      website: 'http://doubledutch.me'
    })
  end

end
