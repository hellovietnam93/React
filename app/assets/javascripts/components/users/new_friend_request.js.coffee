@NewFriendRequest = React.createClass
  getInitialState: ->
    requester_id: Current_user.id
    requested_id: @props.user.id

  handleNewFriendRequest: (e) ->
    e.preventDefault()
    $.ajax
      method: "POST"
      url: FriendRequests_path
      data:
        friend_request: @state
        authenticity_token: getMetaContent("csrf-token")
      dataType: "JSON"
      success: (data) =>
        @props.handleNewFriendRequest data

  render: ->
    React.DOM.tr
      className: "user-" + @props.user.id
      React.DOM.td
        className: "email"
        React.DOM.a
          href: Users_path + @props.user.id
          @props.user.email
      React.DOM.td
        className: "action"
        React.DOM.a
          className: "btn btn-primary"
          href: ""
          onClick: @handleNewFriendRequest
          I18n.t("users.actions.add_friend")
