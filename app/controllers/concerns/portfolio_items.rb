require 'active_hash'

class PortfolioItems < ActiveHash::Base

  self.data = [
    {
      name: 'Goldbely',
      role: 'Design + Front-End Dev',
      timeframe: 'Current Project',
      blurb: "A website where you can order iconic regional dishes from across the country, shipped to your door",
      outbound_link: OpenStruct.new({
        label: 'Visit Goldbely.com',
        url: 'https://goldbely.com',
      }),
      samples: [
        OpenStruct.new({
          slug: 'search-autocomplete',
          caption: "<strong>Search autocomplete</strong> updates with live results as you type",
        }),
        OpenStruct.new({
          slug: 'order-status',
          caption: "<strong>Order status page</strong>",
        }),
        OpenStruct.new({
          slug: 'homepage-carousel',
          caption: "<strong>Homepage carousel</strong> with strong click incentives and prominent navigation",
        }),
        OpenStruct.new({
          slug: 'delivery-date-calendar',
          caption: "<strong>Delivery date calendar</strong> shows shipping charge for each day.",
        }),
      ],
    },
    {
      name: 'Any.do Travel',
      role: 'Design + Front-End Dev',
      timeframe: 'Fall 2013 - Summer 2014',
      blurb: "A partnership between Any.do and OLSET that allows you to book hotels from the Any.do Android app",
      outbound_link: OpenStruct.new({
        label: 'Download Any.do',
        url: 'https://play.google.com/store/apps/details?id=com.anydo',
      }),
      samples: [
        OpenStruct.new({
          slug: 'three-screens',
          caption: "Book hotels from the Any.do to-do list app, powered by OLSET",
        }),
      ],
    },
    {
      name: 'OLSET',
      role: 'Design + Front-End Dev',
      timeframe: 'Summer 2013 - Summer 2014',
      blurb: "A website that matches you with your ideal hotel based on your travel history",
      outbound_link: OpenStruct.new({
        label: 'Visit OLSET.com',
        url: 'https://olset.com',
      }),
      samples: [
        OpenStruct.new({
          slug: 'hotel-matches',
          caption: "<strong>Hotel search results</strong> with personalized match ratings",
        }),
        OpenStruct.new({
          slug: 'landing-page',
          caption: "<strong>Landing page</strong>",
        }),
      ],
    },
    {
      name: 'OLSET Biz Cards',
      role: 'Design',
      timeframe: 'Winter 2014',
      blurb: "Business cards for OLSET, with a hotel key card theme",
      samples: [
        OpenStruct.new({
          slug: 'realistic',
          caption: "<strong>Business cards</strong> with a hotel key card theme",
        }),
      ],
    },
    {
      name: 'Music App',
      role: 'Design',
      timeframe: 'Winter 2014',
      blurb: "Mockups for a music notation app for Android",
      samples: [
        OpenStruct.new({
          slug: 'two-screens',
          caption:
          "Mockups for a music notation app for Android",
        }),
      ],
    },
    {
      name: 'MyFive',
      role: 'UI Design + Prototyping',
      timeframe: 'Summer 2013',
      blurb: "Designs for a web app that helps freelancers keep track of who's sending them business",
      outbound_link: OpenStruct.new({
        label: 'Visit MyFive.com',
        url: 'http://myfive.com',
      }),
      samples: [
        OpenStruct.new({
          slug: 'new-gig',
          caption: "<strong>Entering a new gig</strong>: a prototype for user testing",
        }),
        OpenStruct.new({
          slug: 'gigs-wireframe',
          caption: "<strong>Gigs dashboard</strong> wireframe",
        }),
      ],
    },
    {
      name: 'Old Person App',
      role: 'Design + XML',
      timeframe: 'Winter 2013',
      blurb: "An Android app with a flashlight, magnifying glass, and large print notebook",
      outbound_link: OpenStruct.new({
        label: 'Download Old Person App',
        url: 'https://play.google.com/store/apps/details?id=com.thirdlayer.oldperson&feature=search_result#?t=W251bGwsMSwxLDEsImNvbS50aGlyZGxheWVyLm9sZHBlcnNvbiJd',
      }),
      samples: [
        OpenStruct.new({
          slug: 'three-screens',
          caption: "An Android app with a flashlight, magnifying glass, and large print notebook",
        }),
      ],
    },
    {
      name: 'Snake',
      role: 'Design + Front-End Dev',
      timeframe: 'Winter 2013',
      blurb: "My version of the classic game Snake, written in Javascript",
      outbound_link: OpenStruct.new({
        label: 'Play Snake',
        url: '/snake',
      }),
      samples: [
        OpenStruct.new({
          slug: 'snake',
          caption: "My version of the classic game Snake, written in Javascript",
        }),
      ],
    },
  ]

  def slug
    name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
  end

  def description_partial_path
    "portfolio_items/descriptions/#{ slug.gsub('-', '_') }"
  end

end
