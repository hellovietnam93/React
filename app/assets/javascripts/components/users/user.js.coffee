@User = React.createClass
  render: ->
    React.DOM.tr
      className: "user-" + @props.user.id
      React.DOM.td
        className: "email"
        React.DOM.a
          href: Users_path + @props.user.id
          @props.user.email
