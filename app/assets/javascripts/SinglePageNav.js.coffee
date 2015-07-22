#= require jquery.singlePageNav

@AP ?= {}

class AP.SinglePageNav

  DEFAULTS =
    context: 'body'

  constructor: ( options ) ->
    options ?= {}
    @contextElm        = $ options.context || DEFAULTS.context
    @navElm            = @contextElm.find('.js__single-page-nav').first()
    @portfolioItemElms = @contextElm.find '.js__portfolio-item'

    @initContent()

  initContent: ->
    @navElm?.singlePageNav
      threshold: @portfolioItemElms.first().outerHeight() * (2/3)
