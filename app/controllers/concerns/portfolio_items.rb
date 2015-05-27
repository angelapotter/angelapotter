require 'active_hash'

class PortfolioItems < ActiveHash::Base

  self.data = [
    {
      name: 'Goldbely',
      role: 'Design + Front-End Dev',
      timeframe: 'Current Project',
      blurb: "A website where you can order iconic regional dishes from across the country, shipped to your door.",
      outbound_link: OpenStruct.new({
        label: 'Visit Goldbely.com',
        url: 'https://goldbely.com',
      }),
      samples: [
        OpenStruct.new({
          slug: 'search-autocomplete',
          caption: "This is Goldbely's search autocomplete. This view updates with live results as the user types his or her search query.",
        }),
        OpenStruct.new({
          slug: 'order-status',
          caption: "This is the customer's order status page. Especially with perishable packages, it's important for customers to feel assured that their package is on schedule.",
        }),
        OpenStruct.new({
          slug: 'homepage-carousel',
          caption: ( "This is the homepage carousel that showcases our featured items.
            I wanted to avoid many of the common <a href=\"http://www.nngroup.com/articles/designing-effective-carousels/\" class=\"link--text\">carousel usability pitfalls</a>,
            providing strong click incentives through prominent navigation." ).html_safe,
        }),
        OpenStruct.new({
          slug: 'delivery-date-calendar',
          caption: "This calendar allows customers to choose what date they want their packages to be delivered and what the shipping charge is for each day.",
        }),
      ],
    },
    {
      name: 'Any.do Travel',
      role: 'Design + Front-End Dev',
      timeframe: 'Fall 2013 - Summer 2014',
      blurb: "A partnership between Any.do and OLSET that allows you to book hotels from the Any.do Android app.",
      outbound_link: OpenStruct.new({
        label: 'Download Any.do',
        url: 'https://play.google.com/store/apps/details?id=com.anydo',
      }),
      samples: [
        OpenStruct.new({
          slug: 'three-screens',
        }),
      ],
    },
    {
      name: 'OLSET',
      role: 'Design + Front-End Dev',
      timeframe: 'Summer 2013 - Summer 2014',
      blurb: "A website that matches you with your ideal hotel based on your travel history.",
      outbound_link: OpenStruct.new({
        label: 'Visit OLSET.com',
        url: 'https://olset.com',
      }),
      samples: [
        OpenStruct.new({
          slug: 'hotel-matches',
          caption: "These are hotel recommnedations based on the user's travel history and specific preferences. Each hotel has a match rating that indicates how well it fits the traveler's preferences.",
        }),
        OpenStruct.new({
          slug: 'landing-page',
          caption: "This is the OLSET landing page.",
        }),
      ],
    },
    {
      name: 'OLSET Biz Cards',
      role: 'Design',
      timeframe: 'Winter 2014',
      blurb: "Business cards for OLSET, with a hotel key card theme.",
      samples: [
        OpenStruct.new({
          slug: 'realistic',
        }),
      ],
    },
    {
      name: 'Music App',
      role: 'Design',
      timeframe: 'Winter 2014',
      blurb: "A mockup for a music notation app for Android.",
      samples: [
        OpenStruct.new({
          slug: 'two-screens',
          caption: "This is a quick mockup I did for an Android music notation app. Above is the main screen, showing the keyboard for inputting individual notes. There are two other keyboards as well: one for phrases and one for playback.",
        }),
      ],
    },
    {
      name: 'MyFive',
      role: 'UI Design + Prototyping',
      timeframe: 'Summer 2013',
      blurb: "Designs for a web app that helps freelancers keep track of who's sending them business.",
      outbound_link: OpenStruct.new({
        label: 'Visit MyFive.com',
        url: 'http://myfive.com',
      }),
      samples: [
        OpenStruct.new({
          slug: 'new-gig',
          caption: "This is a prototype I made for user testing. It takes users through the process of entering a new gig into the web app.",
        }),
      ],
    },
    {
      name: 'Old Person App',
      role: 'Design + XML',
      timeframe: 'Winter 2013',
      blurb: "An Android app with a flashlight, magnifying glass, and large print notebook.",
      outbound_link: OpenStruct.new({
        label: 'Download Old Person App',
        url: 'https://play.google.com/store/apps/details?id=com.thirdlayer.oldperson&feature=search_result#?t=W251bGwsMSwxLDEsImNvbS50aGlyZGxheWVyLm9sZHBlcnNvbiJd',
      }),
      samples: [
        OpenStruct.new({
          slug: 'three-screens',
        }),
      ],
    },
    {
      name: 'Snake',
      role: 'Design + Front-End Dev',
      timeframe: 'Winter 2013',
      blurb: "My version of the classic game Snake, written in Javascript.",
      outbound_link: OpenStruct.new({
        label: 'Play Snake',
        url: '/snake',
      }),
      samples: [
        OpenStruct.new({
          slug: 'snake',
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
