@Signup = React.createClass
  getInitialState: ->
    email:''
    password:''

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
        defaultValue: 'Sign up'
        type: 'button'
        onClick: @_handleRegistrationClick

  _handleInputChange: (ev) ->
    name = e.target.name
    @setState "#{name}": e.target.value

  _handleRegistrationClick: (e) ->
    $.ajax(
      method: 'POST'
      url: '/users.json'
      data:
        user:
          email: @state.email
          password: @state.password
          password_confirmation: @state.password_confirmation
          provider: 'email'
        authenticity_token: Functions.getMetaContent('csrf-token')).done ((data) ->
      location.reload()
      return
    ).bind(this)
    return
