@NewFriendRequests = React.createClass
  getInitialState: ->
    not_friends: @props.requests

  functiontofindIndexById: (id) ->
    i = 0
    while i < @state.not_friends.length
      if @state.not_friends[i].id == id
        return i
      i++
    null

  addNewRequest: (request) ->
    index = @functiontofindIndexById(request.id)
    requests = React.addons.update(@state.not_friends, {$splice: [[index, 1]]})
    @replaceState not_friends: requests

  render: ->
    React.DOM.div
      className: "someone-know"
      React.DOM.h2
        className: "title"
        I18n.t("users.headers.someone_know")
      React.DOM.table
        className: "table table-bordered"
        React.DOM.thead null,
          React.DOM.tr null,
            React.DOM.th null, I18n.t("users.headers.email")
            React.DOM.th null
        React.DOM.tbody null,
          for user in @state.not_friends
            React.createElement NewFriendRequest, key: user.id, user: user, handleNewFriendRequest: @addNewRequest
