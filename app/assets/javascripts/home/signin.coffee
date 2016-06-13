@Signin = React.createClass
  getInitialState: ->
    email:''
    password:''
  componentDidMount: ->
    @props.handle_navbar
    console.log @props.data
    console.log 'rendered sign_in component'
  render: ->
    React.DOM.form
      className: 'test-form'
      React.DOM.input
        name: 'email'
        type: 'email'
        placeholder: 'email'
        value: @state.email
        onChange: @_handleInputChange
      React.DOM.input
        name: 'password'
        type: 'password'
        placeholder: 'password'
        value: @state.password
        onChange: @_handleInputChange
      React.DOM.input
        className: 'button'
        defaultValue: 'Signin'
        type: 'button'
        onClick: @_handleSigninClick
  getMetaContent: (name) ->
    metas = document.getElementsByTagName('meta')
    i = 0
    while i < metas.length
      if metas[i].getAttribute('name') == name
        return metas[i].getAttribute('content')
      i++
    ''
  _handleInputChange: (e) ->
    name = e.target.name
    @setState "#{name}": e.target.value

  _handleSigninClick: (e) ->
    props_data = @props
    $.ajax(
      method: 'POST'
      url: '/users/sign_in.json'
      data:
        user:
          email: @state.email
          password: @state.password
        authenticity_token: @getMetaContent('csrf-token')).done((data) ->
        props_data.handle_navbar data
        props_data.handle_close_dialog
        return
      ).fail ((data) ->
        msg = JSON.parse(data.responseText)
        alert msg.error
        return
    ).bind(this)
    return
