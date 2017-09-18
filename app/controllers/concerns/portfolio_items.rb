require 'active_hash'

class PortfolioItems < ActiveHash::Base

  self.data = [
    {
      name: 'DoubleDutch Unified Messaging',
      company: 'DoubleDutch',
      role: 'End-to-End Design',
      platform: 'Web & Mobile',
      slug: 'doubledutch-unified-messaging',
      blurb: "A messaging center for event attendees to see all their chat activity in one place.",
      show_case_study: true,
    },
    {
      name: 'DoubleDutch Event Engagement Report',
      company: 'DoubleDutch',
      role: 'End-to-End Design',
      platform: 'Web & Mobile',
      slug: 'doubledutch-engagement-report',
      blurb: "An infographic-style report about what attendees did during the event.",
      show_case_study: true,
    },
    {
      name: 'DoubleDutch Edit App',
      company: 'DoubleDutch',
      role: 'End-to-End Design',
      platform: 'Web',
      slug: 'doubledutch-edit-app',
      blurb: "A step-by-step workflow for editing and submitting your mobile event app.",
      show_case_study: true,
    },
    {
      name: 'Goldbely Checkout',
      company: 'Goldbely',
      role: 'Design + Front-End Dev',
      platform: 'Web',
      slug: 'goldbely-checkout',
      blurb: "A web checkout experience for an e-commerce food startup.",
      show_case_study: true,
      outbound_link: OpenStruct.new({
        label: 'View on Goldbely.com',
        url: 'https://www.goldbely.com',
      }),
    },
    {
      name: 'Goldbely Search',
      company: 'Goldbely',
      role: 'Design',
      platform: 'Web',
      slug: 'goldbely-search-autocomplete',
      blurb: "Search results for an e-commerce website that update as you type.",
      outbound_link: OpenStruct.new({
        label: 'View on Goldbely.com',
        url: 'https://www.goldbely.com',
      }),
      show_case_study: true,
    },
    {
      name: 'Goldbely Order History',
      company: 'Goldbely',
      role: 'Design',
      platform: 'Web',
      slug: 'goldbely-order-history',
      blurb: "An e-commerce order history page, where customers can track their food shipments."
    },
    # {
    #   name: 'Goldbely Homepage Carousel',
    #   company: 'Goldbely',
    #   role: 'Design + Front-End Dev',
    #   platform: 'Web',
    #   slug: 'goldbely-homepage-carousel',
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
      name: 'Any.do Hotel Matches',
      company: 'OLSET',
      role: 'Design + Front-End Dev',
      platform: 'Android',
      slug: 'anydo-hotel-matches',
      blurb: "A partnership with Any.do that allows users to book hotels from the Android to-do list app.",
    },
    {
      name: 'OLSET Hotel Matches',
      company: 'OLSET',
      role: 'Design + Front-End Dev',
      platform: 'Web',
      slug: 'olset-hotel-matches',
      blurb: "Hotel search results with match ratings based on the user's preferences and travel history.",
    },
    # {
    #   name: 'Hotel Site Landing Page',
    #   company: 'OLSET',
    #   role: 'Design + Front-End Dev',
    #   platform: 'Web',
    #   slug: 'landing-page',
    #   blurb: "The homepage for OLSET, a hotel booking site.",
    # },
    {
      name: 'Music Notation App',
      role: 'Design',
      platform: 'Android',
      slug: 'music-notation-app',
      blurb: "Mockups for a music notation app for Android.",
    },
    {
      name: 'Old Person App',
      role: 'Design + XML',
      platform: 'Android',
      slug: 'old-person-app',
      blurb: "An Android app with a flashlight, magnifying glass, and large print notebook.",
      outbound_link: OpenStruct.new({
        label: 'Download from Google Play',
        url: 'https://play.google.com/store/apps/details?id=com.thirdlayer.oldperson&feature=search_result#?t=W251bGwsMSwxLDEsImNvbS50aGlyZGxheWVyLm9sZHBlcnNvbiJd',
      }),
    },
    {
      name: 'Gig Tracking App',
      company: 'MyFive',
      role: 'UI Design + Prototyping',
      platform: 'Web',
      slug: 'myfive',
      blurb: "A prototype for a web app that helps freelancers keep track of their referrals."
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

  def sample_image_path
    "portfolio-items/#{ company_slug }/#{ slug }/"
  end

  def show_case_study?
    return show_case_study.present?
  end

  private
  def slugify _string
    _string.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
  end

end
