class ApplicationController < ActionController::Base

  helper_method :body_css_class
  helper_method :portfolio_items
  helper_method :portfolio_items_with_case_studies
  helper_method :social_urls
  helper_method :contact_info
  helper_method :current_job

  def snake
    render layout: false
  end

  def portfolio_items
    @portfolio_items ||= PortfolioItems.all
  end

  def portfolio_items_with_case_studies
    portfolio_items_with_case_studies = []
    @portfolio_items.each_with_index do |item, index|
      portfolio_items_with_case_studies << item if item.show_case_study?
    end
    portfolio_items_with_case_studies
  end

  def body_css_class
    css_class = "#{ params[ :action ].gsub( '_', '-' ) } #{ params[ :controller ].gsub( '_', '-' ) }"
    if @item.present?
      css_class += " show--#{ @item.slug }"
    end
    css_class
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
      position: 'Product Design Lead',
      company: 'Kelvin',
      website: 'http://www.kelvininc.com'
    })
  end

end
