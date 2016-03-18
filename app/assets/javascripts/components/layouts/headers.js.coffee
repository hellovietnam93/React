@Header = React.createClass
  render: ->
    React.DOM.header
      className: 'navbar navbar-fixed-top navbar-inverse'
      React.DOM.div
        className: 'container'
        React.DOM.a
          id: 'logo'
          href: 'http://localhost:3000'
          I18n.t('application.base_title')
        React.DOM.nav
          React.DOM.ul
            className: 'nav navbar-nav navbar-right'
            React.DOM.li
              React.DOM.a
                className: 'users'
                href: ' '
                I18n.t('users.user')
            React.DOM.li
              React.DOM.a
                className: 'records'
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
