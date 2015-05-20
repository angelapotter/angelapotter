#= require modernizr

@AP ?= {}

class AP.PortfolioItemSamples

  SAMPLE_DATA_ATTR = 'name'
  ACTIVE_CLASS     = 'active'
  DOT_ELM_PADDING  = 8

  constructor: ->
    @contextElm       = $ '.js__portfolio-item'
    @containerElm     = @contextElm.find '.js__samples'
    @sampleElms       = @containerElm.find '.js__sample'
    @swipeElm         = @containerElm
    @navContainerElm  = @contextElm.find '.js__samples-navigation'
    @prevArrowElm     = @navContainerElm.find '.js__arrow-prev'
    @nextArrowElm     = @navContainerElm.find '.js__arrow-next'
    @dotsContainerElm = @navContainerElm.find '.js__dots'

    if @dotsContainerElm.length
      @dotElms    = @dotsContainerElm.find '.js__dot'
      @dotFillElm = @dotsContainerElm.find '.js__dot-fill'

    if @sampleElms.length > 1
      @initContent()
      @initEvents()

  initContent: ->
    @navContainerElm.removeClass 'hidden'
    @changeToSample @sampleElms.first()

  initEvents: ->
    @nextArrowElm.on 'click.gb', @changeToNextSample
    @prevArrowElm.on 'click.gb', @changeToPrevSample

    if @dotElms
      @dotElms.on 'click.gb', @onDotClick

    if Modernizr.touch
      do @initTouchEvents

  initTouchEvents: =>
    @swipeElm.swipe {
      swipeLeft: ( _event ) =>
        @onSwipeLeft _event
      ,
      swipeRight: ( _event ) =>
        @onSwipeRight _event
      ,
      excludedElements: '',
      threshold: 70
    }

  onSlideNavChange: ( _event ) =>
    targetNavElm    = $ _event.currentTarget
    targetSampleElm = @sampleElms.filter ( _i, _item ) =>
      $( _item ).data( SAMPLE_DATA_ATTR ) is targetNavElm.data( SAMPLE_DATA_ATTR )

    @changeToSample targetSampleElm

  onDotClick: ( _event ) =>
    @onSlideNavChange _event

  onSwipeLeft: ( _event ) =>
    @changeToNextSample()

  onSwipeRight: ( _event ) =>
    @changeToPrevSample()

  changeToSample: ( _sampleElm ) ->
    sampleIndex = @sampleElms.index _sampleElm

    if @dotElms
      @dotFillElm.css
        left: @dotElms.outerWidth() * sampleIndex + DOT_ELM_PADDING

    @containerElm.css
      left: ( @sampleElms.outerWidth() * sampleIndex ) * -1

    @activeSampleElm = _sampleElm

  changeToNextSample: =>
    nextSlideElm = @activeSampleElm.next @sampleElms

    if nextSlideElm.length
      @changeToSample nextSlideElm
    else
      @changeToSample @sampleElms.first()

  changeToPrevSample: =>
    prevSlideElm = @activeSampleElm.prev @sampleElms

    if prevSlideElm.length
      @changeToSample prevSlideElm
    else
      @changeToSample @sampleElms.last()
