
@Banner = React.createClass
  getInitialState: ->
    banners: @props.data
  componentDidMount: ->
    $(document).foundation();
  render: ->
    React.DOM.div
      className: 'orbit'
      role: 'region'
      'aria-label': "Favorite Space Pictures"
      'data-orbit': ''
      React.DOM.ul
        className: 'orbit-container'
        React.DOM.button
          className: 'orbit-previous'
          React.DOM.span
            className: 'show-for-sl'
            '<'
        React.DOM.button
          className: 'orbit-next'
          React.DOM.span
            className: 'show-for-sl'
            '>'
        for banner in @state.banners
          React.DOM.li
            className: 'orbit-slide'
            React.DOM.img
              className: 'orbit-image'
              src: banner.src
            React.DOM.figcaption
              className: 'orbit-caption'
              banner.caption

      React.DOM.nav
        className: 'orbit-bullets'
        for banner, index in @state.banners
          React.DOM.button
            'data-slide': index
            React.DOM.span
              className: 'show-for-sr'
