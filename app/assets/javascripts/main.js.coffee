#= require PortfolioItem

@AP ?= {}

AP.common =
  init: ->
    new AP.PortfolioItem


$(document).on 'page:change', =>
  @AP.common.init()
