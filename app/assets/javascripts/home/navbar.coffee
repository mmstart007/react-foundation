@Navbar = React.createClass
  getInitialState: ->
    user: @props.data
  componentDidMount: ->
    console.log @state.user.signed_in == true
    # $.ajax(
    #   method: 'GET'
    #   url: '/auth/is_signed_in.json').done ((data) ->
    #   @setState user: data
    #   return
    # ).bind(this)
  openSignin: ->
    ReactDOM.render React.createElement(Dialog, id: 'sign_up-modal', show: true, 'aria-labelledby': 'sign_in-modal-title', title: 'Sign in', className: 'small', content: Signin), document.getElementById('modal_wrapper')
  openSignup: ->
    # React.createElement Dialog, id: 'sign_up-modal', show: true, 'aria-labelledby': 'sign_up-modal-title', className: 'tiny'
    ReactDOM.render React.createElement(Dialog, id: 'sign_up-modal', show: true, 'aria-labelledby': 'sign_in-modal-title', title: 'Sign up', className: 'small', content: Signup), document.getElementById('modal_wrapper')

  render: ->
    React.DOM.div
      className: 'title-bar'
      'data-hide-for': 'medium'
      'data-responsive-toggle': 'mingsblog-menu'
      React.DOM.button
        className: 'menu-icon'
        'data-toggle':''
        type: 'button'
      React.DOM.div
        className: 'Menu'
    React.DOM.div
      id: 'mingblog-menu'
      className: 'top-bar'
      React.DOM.div
        className: 'top-bar-left'
        React.DOM.ul
          className: 'menu'
          React.DOM.li
            className: 'menu-text'
            "Ming's"
            React.DOM.i
              "Blog"
          React.DOM.li
            className: null
            React.DOM.a
              href: "/"
              "HOME"
          React.DOM.li
            className: null
            React.DOM.a
              href: "#"
              "Archives"
          React.DOM.li
            className: null
            React.DOM.a
              href: "#"
              "Readme"
      React.DOM.div
        className: 'top-bar-right'
        React.DOM.ul
          className: 'dropdown menu'
          'data-dropdown-menu': ''
          if @state.user.signedIn == true
            React.DOM.li null,
              React.DOM.a
                href: "#"
                @state.user.email
                React.DOM.ul
                  className: 'menu'
                  React.DOM.li null,
                    React.DOM.a
                      href: ''
                      "My Profile"
                  React.DOM.li null,
                    React.DOM.a
                      href: '/users/sign_out'
                      "My Profile"
          else
            React.DOM.li null,
              React.DOM.a
                href: '#'
                onClick: @openSignin
                "Sign in"
            React.DOM.li null,
              React.DOM.a
                href: '#'
                onClick: @openSignup
                "Sign up"
