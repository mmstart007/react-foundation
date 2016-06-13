@Modal = React.createClass
  propTypes:
    id: React.PropTypes.string
    show: React.PropTypes.bool

  getInitialState: ->
    show: false

  getDefaultProps: ->
    id: 'generic-modal-popup'

  modalCode: ->
    if !@props.show
      return
    `var {className, show, ...other} = this.props`
    `className = (className || '') + ' reveal-modal'`
    __html: React.renderToStaticMarkup `
      <div className={className} data-reveal aria-hidden="true" role="dialog" {...other}>
        <div className="placeholder"></div>
        <a className="close-reveal-modal" aria-label="Close">&#215;</a>
      </div>`

  render: ->
    `<div
      ref={this._setModalRef}
      className="hidden"
      dangerouslySetInnerHTML={this.modalCode()}
     >
     </div>`

  componentDidMount: ->
    @componentDidUpdate()

  componentDidUpdate: ->
    if @props.show
      @onShow()
    else
      modalId = '#' + @props.id + '[data-reveal]'
      $(modalId).foundation('reveal', 'close')

  _setModalRef: (ref) ->
    if Object.isFrozen(@refs) && !Object.keys(@refs).length
      @refs = {}
    @refs.dialog = ref

  onShow: ->
    me = @
    node = $( React.findDOMNode(@refs.dialog) )
    modalId = '#' + @props.id + '[data-reveal]'
    $(document).on 'open.fndtn.reveal', modalId, ->
      $(document).off 'open.fndtn.reveal', modalId
      holder = $(@).find('.placeholder').get(0)
      React.render `<div>{me.props.children}</div>`, holder

    $(document).on 'closed.fndtn.reveal', modalId, ->
      $(document).off 'closed.fndtn.reveal', modalId
      holder = $(@).find('.placeholder').get(0)
      React.unmountComponentAtNode(holder)
      me.onHide()

    node.find('.reveal-modal').foundation('reveal', 'open')

  onHide: ->
    if typeof @props.onHide == 'function'
      @props.onHide()
