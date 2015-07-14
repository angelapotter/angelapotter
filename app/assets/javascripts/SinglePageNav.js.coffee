#= require jquery.singlePageNav

@AP ?= {}

class AP.SinglePageNav

  DEFAULTS =
    context: 'body'

  constructor: ( options ) ->
    options ?= {}
    @contextElm = $ options.context || DEFAULTS.context
    @navElm = @contextElm.find '.js__single-page-nav'
    @initContent()

  initContent: ->
    @navElm?.singlePageNav()
