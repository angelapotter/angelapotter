#= require PortfolioItemSamples

@AP ?= {}

class AP.PortfolioItem

  constructor: ->
    new AP.PortfolioItemSamples

$ ->
  new AP.PortfolioItem
