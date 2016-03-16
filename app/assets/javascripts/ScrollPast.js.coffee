@AP ?= {}

class AP.ScrollPast

  CONTEXT_SELECTORS  = 'html, body'
  TRIGGER_SELECTOR   = '.js__scroll-past-trigger'
  CONTAINER_SELECTOR = '.js__scroll-past-container'

  constructor: ->
    @contextElms = $ CONTEXT_SELECTORS
    @triggerElms = @contextElms.find TRIGGER_SELECTOR

    @initEvents()

  initEvents: ->
    @triggerElms?.on 'click.ap', @onClick

  onClick: ( event ) =>
    event.preventDefault()

    elm = $ event.currentTarget
    @contextElms.animate
      scrollTop: elm.closest( CONTAINER_SELECTOR ).next().offset().top

