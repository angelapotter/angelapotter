#= require hammer
#= require mousetrap

@AP ?= {}

class AP.PortfolioItemSamples

  BODY_OPEN_CLASS       = 'sample-open'
  OPENING_CLASS          = 'opening'
  OPEN_CLASS            = 'open'
  ACTIVE_CLASS          = 'active'
  LEFT_OF_ACTIVE_CLASS  = 'left-of-active'
  HIDDEN_CLASS          = 'hidden'
  DATA_ATTR             = 'sample'

  CONTEXT_SELECTOR  = 'body'
  TRIGGER_SELECTOR  = '.js__portfolio-item-sample-trigger'
  TEMPLATE_SELECTOR = '.js__portfolio-item-samples-template'
  SAMPLE_SELECTOR   = '.js__portfolio-item-sample'
  SAMPLES_SELECTOR  = '.js__portfolio-item-samples'
  CLOSE_SELECTOR    = '.js__close'
  PREV_SELECTOR     = '.js__previous'
  NEXT_SELECTOR     = '.js__next'

  OPENING_TIME      = 600

  constructor: ->
    @contextElm        = $( CONTEXT_SELECTOR ).first()
    @samplesElm        = $( SAMPLES_SELECTOR ).first()
    @sampleElms        = $ SAMPLE_SELECTOR
    @sampleTriggerElms = $ TRIGGER_SELECTOR
    @samplesTemplate   = $ TEMPLATE_SELECTOR

    if @sampleTriggerElms.length
      @initEvents()


  # EVENTS

  initEvents: ->
    $( TRIGGER_SELECTOR ).on 'click.ap', @onTriggerClick
    @samplesElm
      .on 'click.ap', CLOSE_SELECTOR, @onCloseClick
      .on 'click.ap', PREV_SELECTOR,  @onPrevClick
      .on 'click.ap', NEXT_SELECTOR,  @onNextClick

    hammertime = new Hammer @samplesElm[0]
    hammertime.on 'swiperight', @onPrevClick
    hammertime.on 'swipeleft', @onNextClick

  onTriggerClick: ( event ) =>
    coverElm = $ event.currentTarget
    targetSlug = coverElm.data DATA_ATTR

    @sampleElms.each ( i, item ) =>
      sampleElm = $ item
      slug = sampleElm.data DATA_ATTR

      if slug is targetSlug
        @openSample sampleElm, coverElm

  onCloseClick: ( event ) =>
    @closeSamples()

  onNextClick: ( event ) =>
    @goToNext()

  onPrevClick: ( event ) =>
    @goToPrev()


  # FUNCTIONALITY

  openSample: ( sampleElm, coverElm ) ->
    @contextElm.addClass BODY_OPEN_CLASS
    @samplesElm
      .addClass OPEN_CLASS
      .addClass OPENING_CLASS

    @goToSample sampleElm, coverElm

    @openingTimer = setTimeout =>
      @samplesElm.removeClass OPENING_CLASS
    , OPENING_TIME

    @bindKeyboardEvents()

  closeSamples: ->
    @samplesElm
      .removeClass OPEN_CLASS
      .removeClass OPENING_CLASS

    @contextElm.removeClass BODY_OPEN_CLASS
    @openCoverElm = null
    @openSampleElm = null

    clearTimeout @openingTimer

    @unbindKeyboardEvents()

  bindKeyboardEvents: ->
    Mousetrap.bind 'left', @onPrevClick
    Mousetrap.bind 'right', @onNextClick
    Mousetrap.bind 'esc', @onCloseClick

  unbindKeyboardEvents: ->
    Mousetrap.reset()

  goToSample: ( sampleElm, sampleElms, coverElm ) ->
    @openCoverElm = coverElm
    @openSampleElm = sampleElm

    @sampleElms.removeClass ACTIVE_CLASS

    index = @sampleElms.index @openSampleElm
    @sampleElms.filter( ":lt(#{ index })" )
      .addClass LEFT_OF_ACTIVE_CLASS
    @sampleElms.filter( ":gt(#{ index })" ).add @openSampleElm
      .removeClass LEFT_OF_ACTIVE_CLASS

    @openSampleElm.addClass ACTIVE_CLASS
    # @hideShowArrows()

  goToNext: ->
    nextSample = @openSampleElm.next SAMPLE_SELECTOR

    if nextSample.length
      @goToSample nextSample

  goToPrev: ->
    prevSample = @openSampleElm.prev SAMPLE_SELECTOR

    if prevSample.length
      @goToSample prevSample

  hideShowArrows: ->
   prevArrow = @samplesElm.find PREV_SELECTOR
   nextArrow = @samplesElm.find NEXT_SELECTOR

   if @openSampleElm.prev( SAMPLE_SELECTOR ).length
     prevArrow.removeClass HIDDEN_CLASS
   else
     prevArrow.addClass HIDDEN_CLASS

   if @openSampleElm.next( SAMPLE_SELECTOR ).length
     nextArrow.removeClass HIDDEN_CLASS
   else
     nextArrow.addClass HIDDEN_CLASS
