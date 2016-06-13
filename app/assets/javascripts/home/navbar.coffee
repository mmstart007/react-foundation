@Navbar = React.createClass
  getInitialState: ->
    user: @props.data
  componentDidMount: ->
    console.log "rendered Navbar"
  _handleChangeNavbar: (user) ->
    console.log user
  openSignin: ->
    ReactDOM.render React.createElement(Dialog, id: 'sign_up-modal', show: true, 'aria-labelledby': 'sign_in-modal-title', title: 'Sign in', className: 'small', content: Signin, handleNavbar: @_handleChangeNavbar), document.getElementById('modal_wrapper')
  openSignup: ->
    # React.createElement Dialog, id: 'sign_up-modal', show: true, 'aria-labelledby': 'sign_up-modal-title', className: 'tiny'
    ReactDOM.render React.createElement(Dialog, id: 'sign_up-modal', show: true, 'aria-labelledby': 'sign_in-modal-title', title: 'Sign up', className: 'small', content: Signup, handleNavbar: @_handleChangeNavbar), document.getElementById('modal_wrapper')

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
      React.DOM.div
        className: 'top-bar-right'
        React.DOM.ul
          className: 'dropdown menu'
          'data-dropdown-menu': ''
          if @state.user.signed_in == true
            React.DOM.li null,
              React.DOM.a
                href: "#"
                @state.user.user.email
              React.DOM.ul
                className: 'menu'
                React.DOM.li null,
                  React.DOM.a
                    href: ''
                    "My Profile"
                React.DOM.li null,
                  React.DOM.a
                    'data-confirm':"Are you sure?"
                    'data-method': 'delete'
                    href: '/users/sign_out'
                    "Signout"
          else
            React.DOM.li
              className: 'test1'
              role: 'menuitem'
              React.DOM.a
                href: '#'
                onClick: @openSignin
                "Sign in"
          if @state.user.signed_in != true
            React.DOM.li
              className: 'test2'
              role: 'menuitem'
              React.DOM.a
                href: '#'
                onClick: @openSignup
                "Sign up"
