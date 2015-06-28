require 'active_hash'

class PortfolioItems < ActiveHash::Base

  self.data = [
    {
      name: 'Search Autocomplete',
      company: 'Goldbely',
      role: 'Design',
      platform: 'Web',
      slug: 'search-autocomplete',
      blurb: "This is the search autocomplete for Goldbely, an e-commerce website where you can order food from shops across the country. It updates with the top search results for your query as you type.",
      outbound_link: OpenStruct.new({
        label: 'Visit Goldbely.com',
        url: 'https://www.goldbely.com',
      }),
    },
    {
      name: 'Order Status Page',
      company: 'Goldbely',
      role: 'Design',
      platform: 'Web',
      slug: 'order-status',
      blurb: "This is the order status page, where customers can follow the progress of their packages from Goldbely.",
    },
    {
      name: 'Homepage Carousel',
      company: 'Goldbely',
      role: 'Design + Front-End Dev',
      platform: 'Web',
      slug: 'homepage-carousel',
      blurb: "The rotating carousel on the Goldbely homepage, featuring our current sales and promotions.",
      outbound_link: OpenStruct.new({
        label: 'Visit Goldbely.com',
        url: 'https://www.goldbely.com',
      }),
    },
    {
      name: 'Shipment Delivery Date Calendar',
      company: 'Goldbely',
      role: 'Design + Front-End Dev',
      platform: 'Web',
      blurb: "A website where you can order iconic regional dishes from across the country, shipped to your door",
      slug: 'order-status',
      outbound_link: OpenStruct.new({
        label: 'Visit Goldbely.com',
        url: 'https://www.goldbely.com',
      }),
    },
    {
      name: 'Any.do Travel',
      company: 'OLSET',
      role: 'Design + Front-End Dev',
      platform: 'Android',
      slug: 'any-do',
      blurb: "A partnership between Any.do and OLSET, that allows you to book hotels from within the Any.do Android app",
      outbound_link: OpenStruct.new({
        label: 'Download Any.do',
        url: 'https://play.google.com/store/apps/details?id=com.anydo',
      }),
    },
    {
      name: 'Hotel Search Results',
      company: 'OLSET',
      role: 'Design + Front-End Dev',
      platform: 'Web',
      slug: 'hotel-matches',
      caption: "<strong>Hotel search results</strong> with personalized match ratings",
      blurb: "A website that matches you with your ideal hotel based on your travel history",
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
      blurb: "A website that matches you with your ideal hotel based on your travel history",
      outbound_link: OpenStruct.new({
        label: 'Visit OLSET.com',
        url: 'https://olset.com',
      }),
    },
    {
      name: 'Music App',
      role: 'Design',
      platform: 'Android',
      slug: 'music-app',
      blurb: "Mockups for a music notation app for Android",
    },
    {
      name: 'Gig Tracking App',
      company: 'MyFive',
      role: 'UI Design + Prototyping',
      platform: 'Web',
      slug: 'new-gig',
      caption: "<strong>Entering a new gig</strong>: a prototype for user testing",
      blurb: "Designs for a web app that helps freelancers keep track of who's sending them business",
      outbound_link: OpenStruct.new({
        label: 'Visit MyFive.com',
        url: 'http://myfive.com',
      }),
    },
    {
      name: 'Old Person App',
      role: 'Design + XML',
      platform: 'Winter 2013',
      slug: 'old-person',
      blurb: "An Android app with a flashlight, magnifying glass, and large print notebook",
      outbound_link: OpenStruct.new({
        label: 'Download Old Person App',
        url: 'https://play.google.com/store/apps/details?id=com.thirdlayer.oldperson&feature=search_result#?t=W251bGwsMSwxLDEsImNvbS50aGlyZGxheWVyLm9sZHBlcnNvbiJd',
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
