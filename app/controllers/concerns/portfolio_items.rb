require 'active_hash'

class PortfolioItems < ActiveHash::Base

  self.data = [
    {
      name: 'Goldbely',
      role: 'Design + Front-End Dev',
      timeframe: 'Current',
      blurb: "A website where you can order iconic regional dishes from across the country, shipped to your door.",
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
          caption: "We allow customers to choose an arrival date for their packages. Because many merchants don't ship every day and perishable packages are time sensitive, the customer needs to be able to see at a glance which days have free shipping, and which days require more costly expedited shipping.",
        }),
      ],
    },
    {
      name: 'Any.do Travel',
      role: 'Design + Front-End Dev',
      timeframe: 'Fall 2013 — Summer 2014',
      blurb: "A partnership between Any.do and OLSET that allows you to book hotels from the Any.do Android app.",
      samples: [
        OpenStruct.new({
          slug: 'three-screens',
        }),
      ],
    },
    {
      name: 'OLSET',
      role: 'Design + Front-End Dev',
      timeframe: 'Summer 2013 — Summer 2014',
      blurb: "A website that matches you with your ideal hotel based on your travel history.",
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
      blurb: "A design I did for a music notation app for Android.",
      samples: [
        OpenStruct.new({
          slug: 'two-screens',
          caption: "",
        }),
      ],
    },
    {
      name: 'MyFive',
      role: 'UI Design + Prototyping',
      timeframe: 'Summer 2013',
      blurb: "Designs for a web app that helps freelancers keep track of who's sending them business.",
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
