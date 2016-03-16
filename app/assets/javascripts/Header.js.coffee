#= require headroom

@AP ?= {}

class AP.Header

  HEADER_SELECTOR = '.js__header'

  constructor: ->
    @headerElm = $( HEADER_SELECTOR ).first()

    @initContent()

  initContent: ->
    headroom = new Headroom @headerElm[ 0 ]
    headroom.init()
