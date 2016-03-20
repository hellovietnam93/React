@Header = React.createClass
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
