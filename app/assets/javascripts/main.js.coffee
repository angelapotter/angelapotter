#= require BackToTop
#= require SinglePageNav

@AP ?= {}

AP.common =
  init: ->
    new AP.SinglePageNav
    new AP.BackToTop

$(document).on 'page:change', =>
  @AP.common.init()
