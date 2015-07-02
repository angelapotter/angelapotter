require 'active_hash'

class PortfolioItems < ActiveHash::Base

  self.data = [
    {
      name: 'Search Autocomplete',
      company: 'Goldbely',
      role: 'Design',
      platform: 'Web',
      slug: 'search-autocomplete',
      blurb: "The search autocomplete for Goldbely, an e-commerce website where you can order food shipped from shops across the country. It updates with the top search results for your query as you type.",
      outbound_link: OpenStruct.new({
        label: 'View live on Goldbely.com',
        url: 'https://www.goldbely.com',
      }),
    },
    {
      name: 'Order Status Page',
      company: 'Goldbely',
      role: 'Design',
      platform: 'Web',
      slug: 'order-status',
      blurb: "The order status page for Goldbely, where customers can follow the progress of their packages.",
    },
    # {
    #   name: 'Homepage Carousel',
    #   company: 'Goldbely',
    #   role: 'Design + Front-End Dev',
    #   platform: 'Web',
    #   slug: 'homepage-carousel',
    #   blurb: "The rotating carousel on the Goldbely homepage, featuring our current sales and promotions.",
    #   outbound_link: OpenStruct.new({
    #     label: 'Visit Goldbely.com',
    #     url: 'https://www.goldbely.com',
    #   }),
    # },
    # {
    #   name: 'Shipment Delivery Date Calendar',
    #   company: 'Goldbely',
    #   role: 'Design + Front-End Dev',
    #   platform: 'Web',
    #   blurb: "A website where you can order iconic regional dishes from across the country, shipped to your door",
    #   slug: 'delivery-date-calendar',
    #   outbound_link: OpenStruct.new({
    #     label: 'Visit Goldbely.com',
    #     url: 'https://www.goldbely.com',
    #   }),
    # },
    {
      name: 'Any.do Travel',
      company: 'OLSET',
      role: 'Design + Front-End Dev',
      platform: 'Android',
      slug: 'any-do',
      blurb: "A partnership between Any.do and OLSET that allows you to book hotels from within the Any.do Android app. Any.do customers can edit their preferences in detail or choose one of the four pre-built profiles get started.",
      outbound_link: OpenStruct.new({
        label: 'Download Any.do for Android',
        url: 'https://play.google.com/store/apps/details?id=com.anydo',
      }),
    },
    {
      name: 'Hotel Search Results',
      company: 'OLSET',
      role: 'Design + Front-End Dev',
      platform: 'Web',
      slug: 'hotel-matches',
      blurb: "The hotel search results for OLSET, a hotel booking site. Each hotel has a personalized match rating based on the customer's preferences and travel history.",
      outbound_link: OpenStruct.new({
        label: 'Visit OLSET.com',
        url: 'https://olset.com',
      }),
    },
    {
      name: 'Hotel Site Landing Page',
      company: 'OLSET',
      role: 'Design + Front-End Dev',
      platform: 'Web',
      slug: 'landing-page',
      blurb: "The homepage for OLSET, a hotel booking site.",
    },
    {
      name: 'Music App',
      role: 'Design',
      platform: 'Android',
      slug: 'music-app',
      blurb: "Mockups for a music notation app for Android.",
    },
    {
      name: 'Old Person App',
      role: 'Design + XML',
      platform: 'Android',
      slug: 'old-person',
      blurb: "An Android app with a flashlight, magnifying glass, and large print notebook",
      outbound_link: OpenStruct.new({
        label: 'Download Old Person App for Android',
        url: 'https://play.google.com/store/apps/details?id=com.thirdlayer.oldperson&feature=search_result#?t=W251bGwsMSwxLDEsImNvbS50aGlyZGxheWVyLm9sZHBlcnNvbiJd',
      }),
    },
    {
      name: 'Gig Tracking App',
      company: 'MyFive',
      role: 'UI Design + Prototyping',
      platform: 'Web',
      slug: 'new-gig',
      blurb: "A user testing prototype for MyFive, a web app that helps freelancers keep track of who sends them the most business.",
      outbound_link: OpenStruct.new({
        label: 'Visit MyFive.com',
        url: 'http://myfive.com',
      }),
    },
  ]

  def company_slug
    if company.present?
      slugify company
    else
      'misc'
    end
  end

  def description_partial_path
    "portfolio_items/descriptions/#{ slug.gsub('-', '_') }"
  end

  private
  def slugify _string
    _string.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
  end

end
