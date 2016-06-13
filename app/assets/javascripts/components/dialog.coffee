@Dialog = React.createClass
  getInitialState: ->
    modal: @props.data
  componentDidMount: ->
    $("##{@props.id}").foundation()
    $("##{@props.id}").foundation('open')
  render: ->
    React.DOM.div
      className: 'small reveal'
      id: @props.id
      'data-reveal': ''
      React.DOM.p
        @props.title
      React.createElement @props.content
      React.DOM.a
        className: "close-button"
        "data-close": ""
        "aria-label": "Close modal"
        type: "button"
        "x"
        React.DOM.span
          'aria-hidden': 'true'
