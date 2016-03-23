@Users = React.createClass
  render: ->
    React.DOM.div
      className: "users"
      React.createElement FriendRequests
      React.createElement NewFriendRequests, requests: @props.data
