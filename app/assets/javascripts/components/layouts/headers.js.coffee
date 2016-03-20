@Header = React.createClass
  getInitialState: ->
    is_signed_in: false
    is_admin: false

  componentWillMount: ->
    $.ajax
      method: 'GET'
      url: 'http://localhost:3000/auth/is_signed_in'
      success: ((data) ->
        @setState is_signed_in: data.signed_in
        return
      ).bind(this)

    $.ajax
      method: 'GET'
      url: 'http://localhost:3000/auth/is_admin'
      success: ((data) ->
        @setState is_admin: data.admin
        return
      ).bind(this)
    return

  handleSignout: (e) ->
    e.preventDefault()
    $.ajax
      method: 'DELETE'
      url: "http://localhost:3000/users/sign_out"
      success: ->
        location.reload()
        return

  not_sign_in: ->
    React.DOM.ul
      className: 'nav navbar-nav navbar-right'
      React.DOM.li
        className: 'sign-in'
        React.DOM.a
          href: 'http://localhost:3000/users/sign_in'
          I18n.t('users.titles.sign_in')
  sign_in: ->
    React.DOM.ul
      className: 'nav navbar-nav navbar-right'
      React.DOM.li
        className: 'users'
        React.DOM.a
          href: ' '
          I18n.t('users.user')
      React.DOM.li
        className: 'records'
        React.DOM.a
          href: 'http://localhost:3000/records'
          I18n.t('records.all')
      React.DOM.li
        className: 'dropdown'
        React.DOM.a
          className: 'dropdown-toggle'
          href: ' '
          'data-toggle': 'dropdown'
          I18n.t('application.action')
            React.DOM.b
              className: 'caret'
        React.DOM.ul
          className: 'dropdown-menu'
          React.DOM.li
            className: 'divider'
          React.DOM.li
            React.DOM.a
              className: 'a'
              href: ' '
              'A'
          React.DOM.li
            React.DOM.a
              className: 'b'
              href: ' '
              'B'
          React.DOM.li
            className: 'divider'
          React.DOM.li
            className: 'sign-out'
            React.DOM.a
              onClick: @handleSignout
              I18n.t('users.titles.sign_out')
  render: ->
    React.DOM.nav
      className: 'navbar navbar-default navbar-static-top'
      'role': 'navigation'
      React.DOM.div
        className: 'container-fluid'
        React.DOM.div
          className: 'navbar-header'
          React.DOM.a
            className: 'navbar-brand'
            href: 'http://localhost:3000'
            I18n.t('application.base_title')
        if @state.is_signed_in
          @sign_in()
        else
          @not_sign_in()
