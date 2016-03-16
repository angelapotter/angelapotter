#= require hammer

@AP ?= {}

class AP.PortfolioItemSamples

  BODY_OPEN_CLASS       = 'sample-open'
  OPEN_CLASS            = 'open'
  CONTENT_VISIBLE_CLASS = 'content-visible'
  HIDDEN_CLASS          = 'hidden'
  DATA_ATTR             = 'sample'

  CONTEXT_SELECTOR  = 'body'
  TRIGGER_SELECTOR  = '.js__portfolio-item-sample-trigger'
  TEMPLATE_SELECTOR = '.js__portfolio-item-sample-template'
  WRAPPER_SELECTOR  = '.js__portfolio-item-sample'
  CLOSE_SELECTOR    = '.js__close'
  PREV_SELECTOR     = '.js__previous'
  NEXT_SELECTOR     = '.js__next'

  constructor: ->
    @contextElm        = $( CONTEXT_SELECTOR ).first()
    @sampleWrapperElm  = $( WRAPPER_SELECTOR ).first()
    @sampleTriggerElms = $ WRAPPER_SELECTOR
    @sampleTemplates   = $ TEMPLATE_SELECTOR

    if @sampleTriggerElms.length
      @initEvents()


  # EVENTS

  initEvents: ->
    $( TRIGGER_SELECTOR ).on 'click.ap', @onTriggerClick
    @sampleWrapperElm
      .on 'click.ap', CLOSE_SELECTOR, @onCloseClick
      .on 'click.ap', PREV_SELECTOR,  @onPrevClick
      .on 'click.ap', NEXT_SELECTOR,  @onNextClick

    hammertime = new Hammer @sampleWrapperElm[0]
    hammertime.on 'swiperight', @onPrevClick
    hammertime.on 'swipeleft', @onNextClick

  onTriggerClick: ( event ) =>
    coverElm = $ event.currentTarget
    targetSlug = coverElm.data DATA_ATTR
    @sampleTemplates.each ( i, item ) =>
      template = $( item )
      slug = template.data DATA_ATTR

      if slug is targetSlug
        @open template, slug, coverElm

  onCloseClick: ( event ) =>
    @close()

  onNextClick: ( event ) =>
    @goToNext()

  onPrevClick: ( event ) =>
    @goToPrev()


  # FUNCTIONALITY

  goToNext: ->
    nextTemplate = @openTemplate.next TEMPLATE_SELECTOR

    if nextTemplate.length
      @openTemplate = nextTemplate

      @lastOpenCoverElm.removeClass OPEN_CLASS
      @lastOpenCoverElm = @lastOpenCoverElm.next TRIGGER_SELECTOR
      @lastOpenCoverElm.addClass OPEN_CLASS

      @sampleWrapperElm
        .removeClass CONTENT_VISIBLE_CLASS
        .html nextTemplate.html()
        .addClass CONTENT_VISIBLE_CLASS
      @hideShowArrows()

  goToPrev: ->
    prevTemplate = @openTemplate.prev TEMPLATE_SELECTOR

    if prevTemplate.length
      @openTemplate = prevTemplate

      @lastOpenCoverElm?.removeClass OPEN_CLASS
      @lastOpenCoverElm = @lastOpenCoverElm.prev TRIGGER_SELECTOR
      @lastOpenCoverElm.addClass OPEN_CLASS

      @sampleWrapperElm
        .removeClass CONTENT_VISIBLE_CLASS
        .html prevTemplate.html()
        .addClass CONTENT_VISIBLE_CLASS
      @hideShowArrows()

  open: ( template, slug, coverElm ) ->
    @openTemplate = template

    @lastOpenCoverElm?.removeClass OPEN_CLASS
    @lastOpenCoverElm = coverElm
    @lastOpenCoverElm.addClass OPEN_CLASS

    @contextElm.addClass BODY_OPEN_CLASS
    @sampleWrapperElm
      .html template.html()
      .addClass OPEN_CLASS
      .addClass CONTENT_VISIBLE_CLASS
    @hideShowArrows()

  close: ->
    @sampleWrapperElm
      .removeClass OPEN_CLASS
      .removeClass CONTENT_VISIBLE_CLASS
    @contextElm.removeClass BODY_OPEN_CLASS
    @openTemplate = null

  hideShowArrows: ->
    prevArrow = @sampleWrapperElm.find PREV_SELECTOR
    nextArrow = @sampleWrapperElm.find NEXT_SELECTOR

    if @openTemplate.prev( TEMPLATE_SELECTOR ).length
      prevArrow.removeClass HIDDEN_CLASS
    else
      prevArrow.addClass HIDDEN_CLASS

    if @openTemplate.next( TEMPLATE_SELECTOR ).length
      nextArrow.removeClass HIDDEN_CLASS
    else
      nextArrow.addClass HIDDEN_CLASS


