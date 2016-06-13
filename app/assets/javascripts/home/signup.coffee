@Signup = React.createClass
  getInitialState: ->
    email:''
    password:''
    password_confirmation:''
  componentDidMount: ->
    console.log 'rendered sign_up component'
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

  _handleRegistrationClick: (e) ->
    props_data = @props
    $.ajax(
      method: 'POST'
      url: '/users.json'
      data:
        user:
          email: @state.email
          password: @state.password
          password_confirmation: @state.password_confirmation
        authenticity_token: @getMetaContent('csrf-token')).fail ((data) ->
          msg = JSON.parse(data.responseText)
          alert msg.error
    ).done ((data) ->
      location.reload()
      return
    ).bind(this)
    return


  render: ->
    React.DOM.form
      className: 'test-form'
      React.DOM.input
        name: 'email'
        type: 'email'
        placeholder: 'email'
        onChange: @_handleInputChange
        # value: @state.email

      React.DOM.input
        name: 'password'
        type: 'password'
        placeholder: 'password'
        onChange: @_handleInputChange
        # value: @state.password

      React.DOM.input
        name: 'password_confirmation'
        type: 'password'
        placeholder: 're-type password'
        onChange: @_handleInputChange
        # value: @state.password_confirmation
      React.DOM.input
        className: 'button'
        defaultValue: 'Signup'
        type: 'button'
        onClick: @_handleRegistrationClick
