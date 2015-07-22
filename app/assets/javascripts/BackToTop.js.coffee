@AP ?= {}

class AP.BackToTop

  DEFAULTS =
    context: 'body'

  constructor: ( options ) ->
    options ?= {}
    @contextElm        = $ options.context || DEFAULTS.context
    @backToTopElm = @contextElm.find('.js__back-to-top').first()

    @initEvents()

  initEvents: ->
    @backToTopElm?.on 'click', @onClick

  onClick: (event) ->
    event.preventDefault()
    $('html, body').animate {scrollTop: 0}
