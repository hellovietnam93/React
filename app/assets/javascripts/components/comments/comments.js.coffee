@Comments = React.createClass
  render: ->
    React.DOM.div
      className: "row"
      React.DOM.div
        className: "col-md-10 col-md-offset-2"
        for comment in @props.comments
          React.createElement Comment, key: comment.id, comment: comment
