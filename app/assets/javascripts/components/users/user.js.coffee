@User = React.createClass
  render: ->
    React.DOM.tr
      className: 'user-' + @props.user.id
      React.DOM.td
        className: 'email'
        React.DOM.a
          href: 'http://localhost:3000/users/' + @props.user.id
          @props.user.email
