#= require BackToTop
#= require Header
#= require PortfolioItemSamples
#= require ScrollPast

@AP ?= {}

AP.common =
  init: ->
    new AP.Header
    new AP.BackToTop
    new AP.PortfolioItemSamples
    new AP.ScrollPast

$(document).on 'page:change', =>
  @AP.common.init()
