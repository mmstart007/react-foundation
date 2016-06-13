@Home = React.createClass
  getInitialState: ->
    user: @props.user_data
    banner: @props.banner

  render: ->
    React.createElement Navbar, data: @state.user    
