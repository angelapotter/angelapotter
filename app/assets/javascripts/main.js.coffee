#= require SinglePageNav

@AP ?= {}

AP.common =
  init: ->
    # new AP.SinglePageNav

$(document).on 'page:change', =>
  @AP.common.init()
