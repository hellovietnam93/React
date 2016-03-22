@Comments = React.createClass
  parentRow: ->
    React.DOM.div
      className: "row"
      React.DOM.div
        className: "comments"
        for comment in @props.comments
          React.createElement Comment, key: comment.id, comment: comment

  childrenRow: ->
    React.DOM.div
      id: "reply-comment-" + @props.parent.id
      className: "row collapse"
      "aria-expanded": false
      React.DOM.div
        className: "comments"
        for comment in @props.comments
          React.createElement Comment, key: comment.id, comment: comment

  render: ->
    if @props.parent == undefined
      @parentRow()
    else
      @childrenRow()
