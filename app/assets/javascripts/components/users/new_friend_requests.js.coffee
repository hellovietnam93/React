@NewFriendRequests = React.createClass
  getInitialState: ->
    not_friends: @props.requests
    search_results: null
    email: null
    username: null

  addNewRequest: (request) ->
    search_results = null
    index = findIndexByKeyValue(@state.not_friends, "id", request.id)
    requests = React.addons.update(@state.not_friends, {$splice: [[index, 1]]})
    if @state.search_results
      index = findIndexByKeyValue(@state.search_results, "id", request.id)
      search_results = React.addons.update(@state.search_results, {$splice: [[index, 1]]})
    @setState not_friends: requests, search_results: search_results

  handleChange: (e) ->
    key = e.target.name
    value = e.target.value

    if key == "email"
      @search_by_email value
    else
      @search_by_username value

  search_by_username: (value) ->
    results = searchByKeyValue(@state.not_friends, "username", value)
    results = searchByKeyValue(results, "email", @state.email)
    @setState username: value, search_results: results

  search_by_email: (value) ->
    results = searchByKeyValue(@state.not_friends, "email", value)
    results = searchByKeyValue(results, "username", @state.username)
    @setState email: value, search_results: results

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
      className: "someone-know"
      React.DOM.h2
        className: "title"
        I18n.t("users.headers.someone_know")
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
            for user in @state.search_results
              React.createElement NewFriendRequest, key: user.id, user: user, handleNewFriendRequest: @addNewRequest
          else
            for user in @state.not_friends
              React.createElement NewFriendRequest, key: user.id, user: user, handleNewFriendRequest: @addNewRequest
