require 'active_hash'

class PortfolioItems < ActiveHash::Base

  self.data = [
    {
      name: 'Goldbely',
      role: 'Design + Front-End Dev',
      timeframe: 'Current',
    },
    {
      name: 'OLSET',
      role: 'Design + Front-End Dev',
      timeframe: 'Summer 2013 — Summer 2014',
    },
    {
      name: 'Any.do Travel',
      role: 'Design + Front-End Dev',
      timeframe: 'Summer 2013 — Summer 2014',
    },
    {
      name: 'OLSET Biz Cards',
      role: 'Design',
      timeframe: 'Summer 2013 — Summer 2014',
    },
    {
      name: 'Music App',
      role: 'Design',
      timeframe: 'Summer 2013 — Summer 2014',
    },
    {
      name: 'MyFive',
      role: 'UI Design + Prototyping',
      timeframe: 'Summer 2013 — Summer 2014',
    },
    {
      name: 'Old Person App',
      role: 'Design + XML',
      timeframe: 'Summer 2013 — Summer 2014',
    },
    {
      name: 'Snake',
      role: 'Design + Front-End Dev',
      timeframe: 'Summer 2013 — Summer 2014',
    },
  ]

  def slug
    name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
  end

end
