
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
          caption: "This is the order status page. Especially with perishable packages, it's important for customers to feel assured that their package is on schedule.",
        }),
        OpenStruct.new({
          slug: 'homepage-carousel',
          caption: ( "This is the homepage carousel that showcases our featured items.
            I wanted to avoid many of the common <a href=\"http://www.nngroup.com/articles/designing-effective-carousels/\" class=\"link--text\">carousel usability pitfalls</a>,
            providing strong click incentives through prominent navigation." ).html_safe,
        }),
      ]
    },
    {
      name: 'Any.do Travel',
      role: 'Design + Front-End Dev',
      timeframe: 'Summer 2013 — Summer 2014',
      blurb: "A partnership between Any.do and OLSET that allows you to book hotels from the Any.do Android app.",
    },
    {
      name: 'OLSET',
      role: 'Design + Front-End Dev',
      timeframe: 'Summer 2013 — Summer 2014',
      blurb: "A website that matches you with your ideal hotel based on your travel history.",
    },
    {
      name: 'OLSET Biz Cards',
      role: 'Design',
      timeframe: 'Summer 2013 — Summer 2014',
      blurb: "Business cards for OLSET, with a hotel key card theme.",
    },
    {
      name: 'Music App',
      role: 'Design',
      timeframe: 'Summer 2013 — Summer 2014',
      blurb: "A design I did for a music notation app for Android.",
    },
    {
      name: 'MyFive',
      role: 'UI Design + Prototyping',
      timeframe: 'Summer 2013 — Summer 2014',
      blurb: "Wireframes and prototypes for a website that helps freelancers keep track of who's sending them business.",
    },
    {
      name: 'Old Person App',
      role: 'Design + XML',
      timeframe: 'Summer 2013 — Summer 2014',
      blurb: "An Android app with a flashlight, magnifying glass, and large print notebook.",
    },
    {
      name: 'Snake',
      role: 'Design + Front-End Dev',
      timeframe: 'Summer 2013 — Summer 2014',
      blurb: "My version of the classic game Snake, written in Javascript.",
    },
  ]

  def slug
    name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
  end

  def description_partial_path
    "portfolio_items/descriptions/#{ slug.gsub('-', '_') }"
  end

end
