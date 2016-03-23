@FriendRequest = React.createClass
  getInitialState: ->
    followed_id: Current_user.id
    follower_id: @props.request.id

  handleNewRelationship: (e) ->
    e.preventDefault()
    $.ajax
      method: "POST"
      url: Relationships_path
      data:
        relationship: @state
        authenticity_token: getMetaContent("csrf-token")
      dataType: "JSON"
      success: (data) =>
        @props.handleFriendRequest data

  render: ->
    React.DOM.tr
      className: "user-" + @props.request.id
      React.DOM.td
        className: "email"
        React.DOM.a
          href: Users_path + @props.request.id
          @props.request.email
      React.DOM.td
        className: "action"
        React.DOM.a
          className: "btn btn-primary"
          href: ""
          onClick: @handleNewRelationship
          I18n.t("users.actions.add_friend")
