@FriendRequests = React.createClass
  getInitialState: ->
    requesters: Current_user.requesters

  functiontofindIndexById: (id) ->
    i = 0
    while i < @state.requesters.length
      if @state.requesters[i].id == id
        return i
      i++
    null

  removeRequest: (request) ->
    index = @functiontofindIndexById(request.id)
    requests = React.addons.update(@state.requesters, {$splice: [[index, 1]]})
    @replaceState requesters: requests

  render: ->
    React.DOM.div
      className: "waiting"
      React.DOM.h2
        className: "title"
        I18n.t("users.headers.reply_request", number: @state.requesters.length)
      React.DOM.table
        className: "table table-bordered"
        React.DOM.thead null,
          React.DOM.tr null,
            React.DOM.th null, I18n.t("users.headers.email")
            React.DOM.th null
        React.DOM.tbody null,
          for request in @state.requesters
            React.createElement FriendRequest, key: request.id, request: request, handleFriendRequest: @removeRequest
