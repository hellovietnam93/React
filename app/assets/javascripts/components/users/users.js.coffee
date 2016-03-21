@Users = React.createClass
  getInitialState: ->
    users: undefined

  componentWillMount: ->
    @serverRequest = $.getJSON('http://localhost:3000/users.json', ((json) ->
      @setState users: json.users
      return
    ).bind(this))
    return

  render: ->
    React.DOM.div
      className: 'users'

      React.DOM.h2
        className: 'title'
        I18n.t('users.user')

      React.DOM.table
        className: 'table table-bordered'
        React.DOM.thead null,
          React.DOM.tr null,
            React.DOM.th null, I18n.t('users.headers.email')
        React.DOM.tbody null,
          unless @state.users is undefined
            for user in @state.users
              React.createElement User, key: user.id, user: user
