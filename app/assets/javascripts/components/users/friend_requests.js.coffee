@FriendRequests = React.createClass
  getInitialState: ->
    requesters: Current_user.requesters
    search_results: null
    email: null
    username: null

  handleChange: (e) ->
    key = e.target.name
    value = e.target.value

    if key == "email"
      @search_by_email value
    else
      @search_by_username value

  search_by_username: (value) ->
    results = searchByKeyValue(@state.requesters, "username", value)
    results = searchByKeyValue(results, "email", @state.email)
    @setState username: value, search_results: results

  search_by_email: (value) ->
    results = searchByKeyValue(@state.requesters, "email", value)
    results = searchByKeyValue(results, "username", @state.username)
    @setState email: value, search_results: results

  removeRequest: (request) ->
    search_results = null
    index = findIndexByKeyValue(@state.requesters, "id", request.id)
    requests = React.addons.update(@state.requesters, {$splice: [[index, 1]]})
    if @state.search_results
      index = findIndexByKeyValue(@state.search_results, "id", request.id)
      search_results = React.addons.update(@state.search_results, {$splice: [[index, 1]]})
    @replaceState requesters: requests, search_results: search_results

  searchRow: ->
    React.DOM.tr
      className: "search"
      React.DOM.td
        className: "username"
        React.DOM.input
          className: "form-control"
          type: "text"
          name: "username"
          placeholder: I18n.t("application.search")
          onChange: @handleChange
      React.DOM.td
        className: "email"
        React.DOM.input
          className: "form-control"
          type: "text"
          name: "email"
          placeholder: I18n.t("application.search")
          onChange: @handleChange
      React.DOM.td null

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
            React.DOM.th null, I18n.t("users.headers.username")
            React.DOM.th null, I18n.t("users.headers.email")
            React.DOM.th null
        React.DOM.tbody null,
          @searchRow()
          if @state.search_results
            for request in @state.search_results
              React.createElement FriendRequest, key: request.id, request: request, handleFriendRequest: @removeRequest
          else
            for request in @state.requesters
              React.createElement FriendRequest, key: request.id, request: request, handleFriendRequest: @removeRequest
